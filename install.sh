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

function install_package()
{
    pack=$1
    bin=$2
    echo -e "$BLUE install $pack $DEFAULT"
    count=5
    while [[ $count -gt 0 ]];do
        apt-get install $pack
        if [ $? -eq 0 ];then
          echo -e "$GREEN install $pack OK $DEFAULT"
          break
        else
          echo -e "$GREEN install $pack FAILED,retry $count $DEFAULT"
          count=$((count-1))
          sleep 1
        fi
    done
}

function install_neovim()
{
    echo -e $BLUE "install neovim $DEFAULT"
    install_package software-properties-common
    add-apt-repository ppa:neovim-ppa/unstable
    if [ $update_source -eq 1 ];then
        apt-get update
    fi
    count=5
    while [[ $count -gt 0 ]];do
        apt-get install neovim
        pip3 install neovim
        if [ $? -eq 0 ];then
            echo -e "$GREEN install neovim OK $DEFAULT"
            break;
        else
            echo -e "$RED install neovim failed retry $count $DEFAULT"
            count=$((count-1))
            sleep 1
        fi
    done
}

function install_zsh()
{
    install_package zsh
    cd /tmp
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
    cd $project
    echo -e "$BLUE setup zsh config $DEFAULT"
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
}
function config_vim()
{
    echo -e "$BLUE setup .vim .vimrc $DEFAULT"
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
}
function install_font()
{
    echo -e "$BLUE install powerline fonts $DEFAULT"
    cd $project/fonts
    sh install.sh
    cd -
}
function config_tmux()
{
    echo -e "$BLUE ######setup configure .tmux.conf####### $DEFAULT"
    copy /home/$user/.tmux.conf $BACKUPDIR/.tmux.conf.bak.$$

    copy $project/.tmux.conf  /home/$user
    chown $user:$user /home/$user/.tmux.conf
}
function copy()
{
    src=$1
    dst=$2
    if [ -e $src ];then
        echo -e "$BLUE cp -Rf $src $dst $DEFAULT"
        cp -Rf $src $dst
        chown -R $user:$user $dst
        if [ $? -eq 0 ];then
            echo -e "$GREEN copy $src--> $dst ok $DEFAULT"
        else
            echo -e "$RED copy $src--> $dst failed $DEFAULT"
        fi
    else
        echo -e "$RED error: $src no exist $DEFAULT"
    fi
}
function install_sougo()
{
    echo -e "$BLUE install sougo input $DEFAULT"
    cd /tmp
    if [ -e sougoupingyin_$$.deb ];then
        rm -f sougoupingyin_2.0.0.0072_amd64.deb
    fi
    wget "http://cdn2.ime.sogou.com/dl/index/1461207453/sogoupinyin_2.0.0.0072_amd64.deb?st=wc3STOG_z9s6NKSPHa4aDA&e=1461635410&fn=sogoupinyin_2.0.0.0072_amd64.deb" -O souginput_$$.deb
    dpkg -i sougoupingyin_$$.deb
    if [ $? -eq 0 ];then
        echo -e "$GREEN install sougou input ok $DEFAULT"
    else
        echo -e "$RED install sougou input failed $DEFAULT"
    fi
    cd  $project
}
function install_virtualenv()
{
    echo -e "$BLUE install virtualenv for neovim $DEFAULT"
    pip install virtualenv
    if [ $? -eq 0 ];then
        echo -e "$GREEN install virtualenv OK $DEFAULT"
        if [ ! -e /home/$user/virtual_env/ ];then
            mkdir -p /home/$user/virtual_env/
        fi
        cd /home/$user/virtual_env
        virtualenv neovim
        chown -R $user:$user /home/$user/virtual_env
    else
        echo -e "$GREEN install virtualenv FAILED $DEFAULT"
    fi
}
if [ "$os"=="linux" ];then
    install_package git
    install_package expect
    install_package tmux
    install_package vim
    install_package python-dev 
    install_package python-pip 
    install_package python3-dev 
    install_package python3-pip
    install_virtualenv
    install_neovim

    install_package ack-grep 
	install_package g++
    install_sougo
    install_package lua5.2
    install_package golang
    install_package curl
elif [ "$os"=="Darwin" ];then
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

# setup config
install_zsh
install_font
config_tmux
config_vim
chown -R $user:$user /home/$user

echo -e "$BLUE You need to run :ssh-keygen -t rsa -C \"youremail\" $DEFAULT"
echo -e "$BLUE Please open vim and run :PluginInstall or :PluginUpdate to install vim-plugins"
echo " cd /home/$user/.vim/bundle/YouCompleteMe/"
echo " sudo ./install.sh --clang-completer --system-libclang"
echo " If dhe git color is not correct you maybe to modify ~/.oh-my-zsh/lib/git.zsh:parse_git_dirty ,because ZSH_THEME_GIT_PROMPT_CLEAN is not empty and ZSH_THEME_GIT_PROMPT_CLEAN=%{^[[34m%}) which will cause the agnoster-new.zsh-theme check as dirty"
echo " Finally,open terminal and edit configure to change font use powerline type $DEFAULT"
echo "
	cd $project/gnome-terminal-colors-solarized
	bash set_dark.sh
    "
echo -e "$GREEN Now install vim or nvim plugin $DEFAULT"
echo -e "$GREEN now reboot your system ,enjoy youself $DEFAULT"
    
