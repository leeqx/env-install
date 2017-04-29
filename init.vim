" You should do this for neovim:
" install 
"   sudo apt-get install python-virtualenv
"   mkvirtualenv neovim
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
" maybe you need add manual: source vimcommon.conf
"
" And vim plugin will intall at ~/.vim/bundle/
source /Users/nano/project/env-install/vimcommon.vim
let g:python_host_prog='/Users/nano/virtual_env/neovim/bin/python'
