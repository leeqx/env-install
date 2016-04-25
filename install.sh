RED="\033[31;1m"
GREEN="\033[32;1m"
BLUE="\033[34;1m"
DEFAULT="\033[0m"
project=`pwd`
if [ $# -lt 1 ];then
    echo -e "$RED usage:$0 update source[1-update|0-unupdate]"
    exit
fi
update_source=$1

issupper=`id|grep root`
if [ -z "$issupper" ];then
	echo -e "$RED ****must run with root $DEFAULT"
	exit
fi

user=`echo $HOME|awk -F'\/' '{print $3}'`
os=`uname`
if [ "$os" == "Linux" ];then
    os="linux"
fi
echo -e "$BLUE OS:$os user:$user $DEFAULT"
BACKUPDIR=/home/$user/backup
if [ ! -e $BACKUPDIR ];then
	mkdir -p $BACKUPDIR
fi

if [ "$os"=="linux" ];then
	#apt-get install git
	echo -e "$BLUE 1. install git $DEFAULT"
	git=`which git`
	if [ -z "$git" ];then
		apt-get install git
		if [ ! -e /home/$user/.ssh/id_rsa.pub ];then
			echo -e "$RED ****you need to run :ssh-keygen -t rsa -C \"youremail\" $DEFAULT"
		fi
	fi
	echo -e "$BLUE 2.install expect $DEFAULT"

	exp=`which expect`
	if [ -z "$expect" ];then
		apt-get install expect
	fi
	echo -e "$BLUE 3.install tmux $DEFAULT"
	tm=`which tmux`
	if [ -z "$tm" ];then
		apt-get install tmux
	fi
	#install newest vim
	echo -e "$BLUE 4.install vim $DEFAULT"
	apt-get install vim
    echo -e $BLUE "4.1 install neovim $DEFAULT"
    sudo apt-get install software-properties-common
    add-apt-repository ppa:neovim-ppa/unstable
    if [ $update_source -eq 1 ];then
        apt-get update
    fi
    count=5
    while [[ $count -gt 0 ]];do
        apt-get install neovim
        if [ $? -eq 0 ];then
            break;
        else
            echo -e "$RED install neovim failed retry $count $DEFAULT"
            count=$((count-1))
        fi
    done
    apt-get install python-dev python-pip python3-dev python3-pip

    echo -e "$BLUE install ack-grep $DEFAULT"
	apt-get install g++
	apt-get install cmake
elif [ "$os"=="mac" ];then
	echo "1. install git"

	git=`which git`
	if [ -z "$git" ];then
		brew install git
		if [ ! -e /home/$user/.ssh/id_rsa.pub ];then
		 echo "****you need to run :ssh-keygen -t rsa -C \"your email\" "
		 exit
		fi
	fi
	echo "2.install expect"

	exp=`which expect`
	if [ -z "$expect" ];then
		brew install expect
	fi
	echo "3.install tmux"
	tm=`which tmux`
	if [ -z "$tm" ];then
		brew install tmux
	fi

	 brew update
	 brew install vim
	 #for YouCompleteMe compile
	 brew install cmake
	 brew install https://raw.github.com/Homebrew/homebrew-dupes/master/grep.rb
else
	echo -e "\033[$RED unsupport system type,should be mac or linux$DEFAULT"
	exit
fi

echo -e "$BLUE 5.install zsh $DEFAULT"
apt-get install zsh
cd /home/$user
count=5
while [[ $count -gt 0 ]];do
    if [ ! -e oh-my-zsh ];then
        git clone git@github.com:robbyrussell/oh-my-zsh.git
    else
        cd oh-my-zsh
        git pull git@github.com:robbyrussell/oh-my-zsh.git
        cd -
    fi
    if [ $? -eq 0 ];then
        chown $user:$user oh-my-zsh -R
        cd oh-my-zsh
        mkdir -p /home/$user/.oh-my-zsh/themes
        cp * /home/$user/.oh-my-zsh -R
        chown $user:$user /home/$user/.oh-my-zsh/ -R
        cd -
        break;
    else
        echo -e "$RED clone oh-my-zsh failed ,retry $count $DEFAULT"
        sleep 1
    fi
    count=$((count-1))
done
echo -e "$BLUE 6.setup configure .tmux.conf $DEFAULT"
# setup config
function copy()
{
    src=$1
    dst=$2
    if [ -e $src ];then
        cp -Rf $src $dst
        chown -R $user:$user $dst
    else
        echo -e "$RED error: $src no exist $DEFAULT"
    fi
}
copy /home/$user/.tmux.conf $BACKUPDIR/.tmux.conf.bak.$$

copy $project/.tmux.conf  /home/$user
chown $user:$user /home/$user/.tmux.conf

echo -e "$BLUE 7.setup .vim .vimrc $DEFAULT"
if [ -e $project/vimconf ];then
	echo -e "$BLUE cp /home/$user/.vimrc $BACKUPDIR/.vimrc.bak.$$ $DEFAULT"
	copy /home/$user/.vimrc $BACKUPDIR/.vimrc.bak.$$
	copy /home/$user/.vim $BACKUPDIR/.vim.bak.$$

	echo -e "$BLUE cp -Rf vimconf/* /home/$user $DEFAULT"
	copy $project/vimconf/.vimrc /home/$user
	cp -R $project/vimconf/.vim /home/$user
	chown $user:$user -R /home/$user/.vim 
fi

echo -e "$BLUE configure for nvim $DEFAULT"
if [ ! -e /home/$user/.config/nvim ];then
    mkdir -p  /home/$user/.config/nvim
fi
copy $project/init.vim /home/$user/.config/nvim/
echo "source $project/vimcommon.vim" >> /home/$user/.config/nvim/init.vim
if [ -e $project/vimconf ];then
    cp -Rf $project/vimconf/.vim/* /home/$user/.config/nvim/
fi
chown $user:$user /home/$user/.config/nvim -R

echo -e "$BLUE 8.setup zsh config $DEFAULT"
copy /home/$user/.zshrc $BACKUPDIR 
copy $project/.zshrc /home/$user
copy $project/oh-my-zsh.sh /home/$user/.oh-my-zsh

echo -e "$BLUE setup zsh as default sh $DEFAULT"
zshfile=`which zsh`
chsh -s $zshfile

echo -e "$BLUE config powerline for zsh $DEFAULT"
mkdir -p /home/$suer/.vim/bundle/tmux-powerline/
chown $user /home/$suer/.vim/bundle/tmux-powerline/
copy $project/powerline*.zsh /home/$suer/.vim/bundle/tmux-powerline/
copy $project/.ycm_extra_conf.py /home/$user/
chown $user /home/$user/.oh-my-zsh/themes
copy $project/agnoster-new.zsh-theme /home/$user/.oh-my-zsh/themes/agnoster-new.zsh-theme
copy $project/powerline_tmux_1.8.conf /home/$user/

if [ "$os"=="Linux" ];then
    echo -e "$BLUE configure terminal color $DEFAULT"
	cd $project/gnome-terminal-colors-solarized
	bash set_dark.sh
fi
echo -e "$BLUE install powerline fonts $DEFAULT"
cd $project/fonts
sh install.sh
cd -

echo -e "$BLUE Please open vim and run :PluginInstall or :PluginUpdate to install vim-plugins"
echo "cd /home/$user/.vim/bundle/YouCompleteMe/"
echo "sudo ./install.sh --clang-completer --system-libclang"
echo "after all you need to reboot your system"
echo "if dhe git color is not correct you maybe to modify ~/.oh-my-zsh/lib/git.zsh:parse_git_dirty ,because ZSH_THEME_GIT_PROMPT_CLEAN is not empty "
echo "and ZSH_THEME_GIT_PROMPT_CLEAN=%{^[[34m%}) which will cause the agnoster-new.zsh-theme check as dirty"
echo "Finally,open terminal and edit configure to change font use powerline type $DEFAULT"

echo -e "$GREEN Now install vim or nvim plugin $DEFAULT"
#vim --cmd PluginInstall
#nvim --cmd PluginInstall
echo -e "$GREEN now reboot your system ,enjoy youself $DEFAULT"
    
