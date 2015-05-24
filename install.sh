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
	tm=`which expect`
	if [ -z "$tm" ];then
		apt-get install tmux
	fi
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
	tm=`which expect`
	if [ -z "$tm" ];then
		brew install tmux
	fi

	 brew update
	 brew install vim
	 brew install cmake
	 brew install https://raw.github.com/Homebrew/homebrew-dupes/master/grep.rb
fi

# setup config
cp /home/$user/.tmux.conf /home/$user/.tmux.conf.bak.$$

cp .tmux.conf  /home/$user
chown $user:$user /home/$user/.tmux.conf


#install newest vim
echo "install vim"
apt-get install vim

git clone git@github.com:leeqx/vimconf.git 
echo "cp /home/$user/.vimrc /home/$user/.vimrc.bak.$$"
mv /home/$user/.vimrc /home/$user/.vimrc.bak.$$
mv /home/$user/.vim /home/$user/.vim.bak.$$

echo "cp -Rf vimconf/* /home/$user"
cp vimconf/.vimrc /home/$user
cp -R vimconf/.vim /home/$user
chown $user:$user /home/$user/.vim -R
chown $user:$user /home/$user/.vimrc

#config powerline for zsh
mkdir -p /home/$suer/.vim/bundle/tmux-powerline/
cp ./powerline*.zsh /home/$suer/.vim/bundle/tmux-powerline/
cp ./.ycm_extra_conf.py /home/$user/
cp ./agnoster-new.zsh-theme /home/$user/.oh-my-zsh/themes/agnoster-new.zsh-theme
#echo 'ZSH_THEME="agnoster-new"' >> /home/$user.zshrc
#echo 'source /home/$user/.oh-my-zsh/oh-my-zsh.sh' >> /home/$user.zshrc
#echo 'source /home/$user/.vim/bundle/tmux-powerline/opwerline.zsh' >> /home/$user.zshrc

echo "Please open vim and run :PluginInstall "


######################################################
# Install vim plugins
######################################################
if [ ! -e /home/$user.vim/autoload/ ];then
	echo "mkdir /home/$user.vimautoload"
	mkdir -p /home/$user.vim/autoload
fi
if [ ! -e /home/$user.vim/bundle/ ];then
	echo "mkdir /home/$user.vim/bundle"
	mkdir -p /home/$user.vim/bundle
fi

#install pathogen
#git clone git@github.com:tpope/vim-pathogen.git 
echo " install pathogen"
curl -LSso /home/$user.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

isExist=`cat /home/$user.vimrc|grep pathogen#infect`
if [ -z $isExist ];then
	echo "execute pathogen#infect()" >> /home/$user.vimrc
fi
isExist=`cat /home/$user.vimrc|grep 'syntax on'`
if [ -z $isExist ];then
	echo "syntax on" >> /home/$user.vimrc
fi
isExist=`cat /home/$user.vimrc|grep 'filetype plugin'`
if [ -z $isExist ];then
	echo "filetype plugin indent on" >> /home/$user.vimrc
fi

#install sensible

cd /home/$user.vim/bundle/
echo "install sensible"
git clone git://github.com/tpope/vim-sensible.git
#install nerdtree
echo "install nerdtree"
git clone git://github.com/scrooloose/nerdtree.git

echo "install srcExpl.git"
git clone https://github.com/wesleyche/SrcExpl.git

cd /home/$user.vim/bundle/YouCompleteMe/
./install.sh --clang-completer
    
