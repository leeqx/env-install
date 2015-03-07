# vimconf

#1.description
this project is it will auto install vim plugins，which will be make your vim use as nerdtree 、tagbar、srcexpl and so on.
and the nerdtree will auto open when the vim is open,even if the open vim without specify file it will also open current
directory. For the srexpl ,will also open auto when vim open.

#2.install
change to the temporary directory or any directory you wish.<br/>
   $cd /tmp<br/>
then execute this command<br/>
   $git clone git@github.com:leeqx/vimconf.git <br/>
Next you maybe backup the file ~/.vim and ~/.vimrc,then copy all file in the /tmp/vimconf/ into ~/ to replace the file at ~/ <br/>
cd /tmp/vimconf/<br/>
cp vimrc ~/.vimrc<br/>
cp -r vim ~/.vim<br/>

then open vim enjoy.
#3.Hot Key
Shift-w ----open/close nerdtree<br/>
Shift-e ----open/close srcexpl<br/>
Ctrl-j  ----jump to definition for the current cussor<br/>
Ctrl-b  ----go back to last position where you call :ctrl-j<br/>




