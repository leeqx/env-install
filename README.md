# env-install
to install developer tools :git expect tmux vim-plugins nevim

## tmux 快捷键
### 启动tmux 需要在
tm ＃前提是设置了alias tm='tmux -2'

### 新建session
Ctrl+t+c 

session跳转
Ctrl＋t＋n  
### 分屏session
Ctrl+t+- 水平分屏
Ctrl+t+| 垂直分屏
分屏之间跳转Ctrl+t+o

### 滚屏
Ctrl＋t＋［
然后可以使用vim快捷店 h、j、k、l上下左右移动
在滚屏模式下，v 进入选择模式采用以上键移动，然后y复制退出滚屏模式；
Ctrl＋t＋］粘贴刚复制的内容

### nvim terminal
normal 模式下下面组合按键分别创建不同位置的term
0. <leader>tj
0. <leader>tk
0. <leader>tl
0. <leader>th

在新建的term窗口按ESC退出terminal模式，回到normal模式，然后可以采用vi的快捷键复制  
再跳到vi的文件中进行粘贴。
在terminal和vi 窗口之间切换，可以按ESC,ESC（注意是两次）回到normal模式然后kjhl上
下左右移动或者是Ctrl-w。

## Install neovim  
see https://github.com/neovim  
python module for neovim  
https://neovim.io/doc/user/nvim_python.html  

0. For linux  
see https://github.com/neovim/neovim/issues/3396  

0. For mac  
  see  http://skipperkongen.dk/2011/11/13/installing-virtual-environment-on-mac/  
  see  http://blog.csdn.net/t1gerr/article/details/9956455  

0. Configure for neovim  
copy init.vim to `~/.config/nvim/`  
configure in `~/.zshrc`  
```shell  
    alias vi='nvim -u ~/.config/nvim/init.vim'  
```
copy `./vimconf/.vim` into `~/.config/nvim/`  
and then open nvim execute `:PluginInstall`   

## Other
You need to editor init.vim to change the path according to you systhem

0. set rtp+=~/.config/nvim/bundle/Vundle.vim
0. let g:python_host_prog = '/home/nano/virtual_env/neovim/bin/python'
0. set runtimepath^=~/.config/nvim/bundle/ctrlp.vim

## Plugin List 
```shell
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'oblitum/YouCompleteMe' , { 'do': './install.py --clang-completer' }
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-markdown'
Plugin 'kopischke/unite-spell-suggest'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Raimondi/delimitMate'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'DoxygenToolkit.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'oblitum/rainbow'
Plugin 'vim-scripts/a.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'bbchung/clighter'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'troydm/zoomwintab.vim'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'
Plugin 'jacobsimpson/nvim-terminal-velocity'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
```
### QA
0. YCM support libs too old, PLEASE RECOMPILE？
 A：Please remove`~/.config/nvim/bundle/YouCompleteMe/` or `~/.vim/bundle/YouCompleteMe/`  
    then open vim or nvim do `:PluginInstall` to reinstall YCM
