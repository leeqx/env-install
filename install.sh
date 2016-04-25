if [ $# -lt 2 ];then
	echo "usage:$0 user os[mac|linux]"
	exit
fi
issupper=`id|grep root`
if [ -z "$issupper" ];then
	echo "****must run with root "
	exit
fi
user=$1
BACKUPDIR=/home/$user/backup
if [ ! -e $BACKUPDIR ];then
	mkdir -p $BACKUPDIR
fi

if [ "$2"=="linux" ];then
	#apt-get install git
	echo "1. install git"
	git=`which git`
	if [ -z "$git" ];then
		apt-get install git
		if [ ! -e /home/$user/.ssh/id_rsa.pub ];then
			echo "****you need to run :ssh-keygen -t rsa -C \"youremail\" "
		fi
	fi
	echo "2.install expect"

	exp=`which expect`
	if [ -z "$expect" ];then
		apt-get install expect
	fi
	echo "3.install tmux"
	tm=`which tmux`
	if [ -z "$tm" ];then
		apt-get install tmux
	fi
	#install newest vim
	echo "4.install vim"
	apt-get install vim

	apt-get install g++
	apt-get install cmake
elif [ "$2"=="mac" ];then
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
	echo "Please install fonts patch for powerline"
	sh ./fonts/install.sh
else
	echo "unsupport system type,should be mac or linux"
	exit
fi

echo "5.install zsh"
apt-get install zsh
cd /home/$user
git clone git@github.com:robbyrussell/oh-my-zsh.git
chown $user:$user oh-my-zsh
cd oh-my-zsh
mkdir -p /home/$user/.oh-my-zsh/themes
cp * /home/$user/.oh-my-zsh -R
cd -
echo "6.setup configure .tmux.conf"
# setup config
function copy()
{
    src=$1
    dst=$2
    if [ -e $src ];then
        cp $src $dst
    else
        echo "error: $src no exist"
    fi
}
copy /home/$user/.tmux.conf $BACKUPDIR/.tmux.conf.bak.$$

copy .tmux.conf  /home/$user
chown $user:$user /home/$user/.tmux.conf

echo "7.setup .vim .vimrc"
#git clone git@github.com:leeqx/vimconf.git 
if [ -e vimconf ];then
	echo "cp /home/$user/.vimrc $BACKUPDIR/.vimrc.bak.$$"
	copy /home/$user/.vimrc $BACKUPDIR/.vimrc.bak.$$
	copy /home/$user/.vim $BACKUPDIR/.vim.bak.$$

	echo "cp -Rf vimconf/* /home/$user"
	copy vimconf/.vimrc /home/$user
	copy -R vimconf/.vim /home/$user
	chown $user:$user -R /home/$user/.vim 
	chown $user:$user /home/$user/.vimrc
fi
echo "8.setup zsh config"
copy /home/$user/.zshrc $BACKUPDIR 
copy .zshrc /home/$user
copy oh-my-zsh.sh /home/$user/.oh-my-zsh

echo "8.setup zsh as default sh"
zshfile=`which zsh`
chsh -s $zshfile

#config powerline for zsh
mkdir -p /home/$suer/.vim/bundle/tmux-powerline/
chown $user /home/$suer/.vim/bundle/tmux-powerline/
copy ./powerline*.zsh /home/$suer/.vim/bundle/tmux-powerline/
copy ./.ycm_extra_conf.py /home/$user/
chown $user /home/$user/.oh-my-zsh/themes
copy ./agnoster-new.zsh-theme /home/$user/.oh-my-zsh/themes/agnoster-new.zsh-theme
copy powerline_tmux_1.8.conf /home/$user/

echo "configure terminal color"
if [ $2 = "linux" ];then
	cd gnome-terminal-colors-solarized
	./set_dark.sh
fi
echo "install fonts"
cd fonts
sh install.sh

echo "Please open vim and run :PluginInstall or :PluginUpdate to install vim-plugins"
echo "You should down poweline and then install  and install font-patch"
echo "cd /home/$user/.vim/bundle/YouCompleteMe/"
echo "sudo ./install.sh --clang-completer --system-libclang"
echo "after all you need to reboot your system"
echo "if dhe git color is not correct you maybe to modify ~/.oh-my-zsh/lib/git.zsh:parse_git_dirty ,because ZSH_THEME_GIT_PROMPT_CLEAN is not empty "
echo "and ZSH_THEME_GIT_PROMPT_CLEAN=%{^[[34m%}) which will cause the agnoster-new.zsh-theme check as dirty"
echo "Finally,open terminal and edit configure to change font use powerline type"

    
