# env-install
to install developer tools :git expect tmux vim-plugins neovim

## tmux 快捷键
  0. 启动tmux 需要在
     tm ＃前提是设置了alias tm='tmux -2'

  0. 新建session
     Ctrl+t+c 

  0. session跳转
     Ctrl＋t＋n  
  0. 分屏session
     Ctrl+t+- 水平分屏
     Ctrl+t+| 垂直分屏
     分屏之间跳转Ctrl+t+o
  0. 滚屏
     Ctrl＋t＋［
     然后可以使用vim快捷店 h、j、k、l上下左右移动
     在滚屏模式下，v 进入选择模式采用以上键移动，然后y复制退出滚屏模式；
     Ctrl＋t＋］粘贴刚复制的内容
  0. 最大化  
     Ctrl + t + z 可以使的当前分窗口最大化，再输入一次则可以恢复  

## vim 快捷键  
  0. 搜索文件  
     0. 在normal 模式，使用快捷键：`ctrl-p`。打开ctrlp之后可以通过`ctrl-b`快捷键在文件名搜索、buffer搜索、函数名搜索（当前打开文件)（这几种模式都是通过方向键上下移动）
     0. 在文件名搜索模式下可以：`ctrl-y`在当前目录下创建文件；  
     0. 在文件名搜索模式下`ctrl-z` 标记文件，`ctrl-o` 打开所有标记的文件  
  0. 在打开的文件中跳转  
    在nomoral模式下`gn`下一个 `gp`上一个 `gd`关闭当前文件
  0. 打开NERDTREE   
     normal模式下`shift-w` 打开或者关闭  
  0.  vim 窗体最大化  
      normal模式下`ctrl+w+o` 最大化，再执行一次可还原  
  0. 跳转之后回到原处  
     normal模式下`ctrl-o`(返回) `ctrl-i`(前进)  
  0. 文件内容搜索  （linux)
    在normal模式下，命令：`Ack foo` 即会搜索当前目录下所有包含foo的行，通过 j,k上下移动,o 可以打开，想要跳转回原来的地方参考上一个快捷键。  
## Install neovim  
  see https://github.com/neovim  
  python module for neovim  
  https://neovim.io/doc/user/nvim_python.html  

  0. For linux  
    see https://github.com/neovim/neovim/issues/3396  

  0. For mac  
    see  http://skipperkongen.dk/2011/11/13/installing-virtual-environment-on-mac/  
    see  http://blog.csdn.net/t1gerr/article/details/9956455  

  0. Other
     You need to editor init.vim to change the path according to you systhem  
     0. set rtp+=~/.config/nvim/bundle/Vundle.vim
     0. let g:python_host_prog = '/home/nano/virtual_env/neovim/bin/python'
     0. set runtimepath^=~/.config/nvim/bundle/ctrlp.vim
  0. neovim nvim terminal  
     normal 模式下下面组合按键分别创建不同位置的term  
     * <leader>tj
     * <leader>tk
     * <leader>tl
     * <leader>th  
     在新建的term窗口按ESC退出terminal模式，回到normal模式，然后可以采用vi的快捷键复制  
     再跳到vi的文件中进行粘贴。
     在terminal和vi 窗口之间切换，可以按ESC,ESC（注意是两次）回到normal模式然后kjhl上
     下左右移动或者是Ctrl-w。


## Plugin List    
  ```sh
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

### solarise color

   ```shell
    SOLARIZED HEX     16/8 TERMCOL  XTERM/HEX   L*A*B      RGB         HSB  
    --------- ------- ---- -------  ----------- ---------- ----------- -----------
    base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
    base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
    base01    #586e75 10/7 brgreen  240 #585858 45 -07 -07  88 110 117 194  25  46
    base00    #657b83 11/7 bryellow 241 #626262 50 -07 -07 101 123 131 195  23  51
    base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
    base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
    base2     #eee8d5  7/7 white    254 #e4e4e4 92 -00  10 238 232 213  44  11  93
    base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
    yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
    orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
    red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
    magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
    violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
    blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
    cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
    green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60
 ```   
### Color theme  
  0. Terminal color theme ubuntu  
   [**Solarized homepage**](http://ethanschoonover.com/solarized)  
   [**Solarized repository**](https://github.com/altercation/solarized)  
   [**Gnome Terminal Colors Solarized repository**](https://github.com/sigurdga/gnome-terminal-colors-solarized)    
   [**dircolors solarised color theme**](https://github.com/seebi/dircolors-solarized)   

  0. vim && iterm theme  
     https://github.com/altercation/solarized/  
