if [ $# -lt 2 ];then
	echo "usage:$0 user os[mac|linux]"
	exit
fi
issupper=`id|grep root`
if [ -z "$issupper" ];then
	echo " must run with root "
	exit
fi
user=$1

if [ "$2" == "linux" ];then

	#apt-get install git
	echo "1. install git"
	git=`which git`
	if [ -z "$git" ];then
		apt-get install git
		if [ ! -e /home/$user/.ssh/id_rsa.pub ];then
		 echo "****you need to run :ssh-keygen -t rsa -C \"lqx0830@hotmail.com\" "
		 exit
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
	echo "install vim"
	apt-get install vim

	apt-get install zsh
	echo "please download oh-my-zsh from github and put then at /home/$user/"

	apt-get install g++
	apt-get install cmake
else
	echo "1. install git"

	git=`which git`
	if [ -z "$git" ];then
		brew install git
		if [ ! -e /home/$user/.ssh/id_rsa.pub ];then
		 echo "****you need to run :ssh-keygen -t rsa -C \"lqx0830@hotmail.com\" "
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
fi

# setup config
cp /home/$user/.tmux.conf /home/$user/.tmux.conf.bak.$$

cp .tmux.conf  /home/$user
chown $user:$user /home/$user/.tmux.conf


git clone git@github.com:leeqx/vimconf.git 

echo "cp /home/$user/.vimrc /home/$user/.vimrc.bak.$$"
mv /home/$user/.vimrc /home/$user/.vimrc.bak.$$
mv /home/$user/.vim /home/$user/.vim.bak.$$

echo "cp -Rf vimconf/* /home/$user"
cp vimconf/.vimrc /home/$user
cp -R vimconf/.vim /home/$user
chown $user -R /home/$user/.vim 
chown $user /home/$user/.vimrc

#config powerline for zsh
mkdir -p /home/$suer/.vim/bundle/tmux-powerline/
chown $user /home/$suer/.vim/bundle/tmux-powerline/
cp ./powerline*.zsh /home/$suer/.vim/bundle/tmux-powerline/
cp ./.ycm_extra_conf.py /home/$user/
mkdir -p /home/$user/.oh-my-zsh/themes
chown $user /home/$user/.oh-my-zsh/themes
cp ./agnoster-new.zsh-theme /home/$user/.oh-my-zsh/themes/agnoster-new.zsh-theme
cp powerline_tmux_1.8.conf /home/$user/

echo "Please open vim and run :PluginInstall or :PluginUpdate to install vim-plugins"
echo "cd /home/$user/.vim/bundle/YouCompleteMe/"
echo "sudo ./install.sh --clang-completer --system-libclang"
    
