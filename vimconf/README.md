# vimconf

#1.description
this project is it will auto install vim plugins，which will be make your vim use as nerdtree 、tagbar、srcexpl and so on.
and the nerdtree will auto open when the vim is open,even if the open vim without specify file it will also open current
directory. For the srexpl ,will also open auto when vim open.

#2.install
1) pull all file from github
>
change to the temporary directory or any directory you wish.<br/>
   $cd /tmp<br/>
then execute this command<br/>
   $git clone git@github.com:leeqx/vimconf.git <br/>
Next you maybe backup the file ~/.vim and ~/.vimrc,then copy all file in the /tmp/vimconf/ into ~/ to replace the file at ~/ <br/>
cd /tmp/vimconf/<br/>
cp vimrc ~/.vimrc<br/>
cp -r vim ~/.vim<br/>

2) use vbundle to install plugin
>
.vimrc on this repository is support the vbundle install and clean plugins.
put the .vimrc in ~/
then open vim
then in command model input PluginInstall ,
:PluginInstall

>then vbundle will auto install plugins.

>if you want to clean plugins,you can do like this:
:PluginClean
then open vim enjoy.

3)for the Youcompleteme plugin
  If you want to use you should do :
  + cd ~/.vim/bundle/YouCompleteMe
  + ./install.sh --clang-completer 
  or
  + ./install.sh --clang-completer --system-libclang

#3.Hot Key
>
1) Nerdtree (git-nerdtree-plugin)  
	Shift-w ----open/close nerdtree<br/>
2) SrcExpl hot-key:  
	Shift-e ----open/close srcexpl<br/>
	Ctrl-j  ----jump to definition for the current cussor<br/>
	Ctrl-b  ----go back to last position where you call :ctrl-j<br/>
	Ctr-w-w ----jump to next window
	Ctr-w-p ----jump to pre window


3) Ctrlp hot-key:

	+ ctrl+p :open ctrlp plugin
	+ open ctrlp then input new file name then input:ctrl+y ,it will open new file then after you edit and save it will create new file
	+ open multi file:ctrl-j+k jump to filelist then use ctrl-z mark file you want to open then ctrl-o to open file(ctrl+w+o file full screen)

	http://kien.github.io/ctrlp.vim/
4) Youcompleteme hotkey:
>
	jd  jump to declearation
