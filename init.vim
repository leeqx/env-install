" You should do this for neovim:
" install 
"   sudo apt-get install python-virtualenv
"   mkvirtualenv neovim
let g:python_host_prog = '/home/roop/virtual_env/neovim/bin/python'

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim


source /home/roop/project/env-install/vimcommon.vim
