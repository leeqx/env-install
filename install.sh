if [ $# -lt 1 ];then
	echo "usage:$0 user"
	exit
fi
issupper=`id|grep root`
if [ -z "$issupper" ];then
	echo " must run with root "
	exit
fi
user=$1
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
echo 'ZSH_THEME="powerline"' >> ~/.zshrc


echo "Please open vim and run :PluginInstall "


######################################################
# Install vim plugins
######################################################
if [ ! -e ~/.vim/autoload/ ];then
		echo "mkdir ~/.vimautoload"
		mkdir -p ~/.vim/autoload
fi
if [ ! -e ~/.vim/bundle/ ];then
		echo "mkdir ~/.vim/bundle"
		mkdir -p ~/.vim/bundle
fi

#install pathogen
#git clone git@github.com:tpope/vim-pathogen.git 
echo " install pathogen"
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

isExist=`cat ~/.vimrc|grep pathogen#infect`
if [ -z $isExist ];then
		echo "execute pathogen#infect()" >> ~/.vimrc
fi
isExist=`cat ~/.vimrc|grep 'syntax on'`
if [ -z $isExist ];then
		echo "syntax on" >> ~/.vimrc
fi
isExist=`cat ~/.vimrc|grep 'filetype plugin'`
if [ -z $isExist ];then
		echo "filetype plugin indent on" >> ~/.vimrc
fi

#install sensible

cd ~/.vim/bundle/
echo "install sensible"
git clone git://github.com/tpope/vim-sensible.git
#install nerdtree
echo "install nerdtree"
git clone git://github.com/scrooloose/nerdtree.git

#install taglist
echo "install taglist"
wget http://vim.sourceforge.net/scripts/download_script.php?src_id=7701
unzip taglist_45.zip
mv taglist_45 taglist

#first time to update taglist
if [ $1 -eq 0 ];then
		#在vim中运行Helptags 查看帮助
		echo "let Tlist_Use_Right_Window = 1
		let Tlist_Exit_OnlyWindow = 1
		let Tlist_Show_One_File = 1
		let Tlist_Sort_Type = 'name'
		let Tlist_Compact_Format = 1
		let g:tlist_php_settings = 'php;c:class;f:function'
		map <D-7> :TlistToggle <CR>" >> ~/.vimrc
fi

echo "install srcExpl.git"
git clone https://github.com/wesleyche/SrcExpl.git

cd ~/.vim/bundle/YouCompleteMe/
./install.sh --clang-completer
    
