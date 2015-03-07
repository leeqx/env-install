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

apt-get install git

if [ ! -e /home/$user/.ssh/id_rsa.pub ];then
 echo "****you need to run :ssh-keygen -t rsa -C \"lqx0830@hotmail.com\" "
fi

echo "2.install expect"
apt-get install expect

echo "3.install tmux"
apt-get install tmux

# setup config
cp /home/$user/.tmux.conf /home/$user/.tmux.conf.bak.$$

cp .tmux.conf  /home/$user
chown $user:$user /home/$user/.tmux.conf


#install vim
echo "install vim"
apt-get install vim
echo "cp /home/$user/.vimrc /home/$user/.vimrc.bak.$$"
mv /home/$user/.vimrc /home/$user/.vimrc.bak.$$
mv /home/$user/.vim /home/$user/.vim.bak.$$
echo "cp -Rf vimconf/* /home/$user"
cp vimconf/.vimrc /home/$user
cp -R vimconf/.vim /home/$user
chown $user:$user /home/$user/.vim -R
chown $user:$user /home/$user/.vimrc

