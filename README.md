- [ ] 介绍
- [ ] 安装说明
- [ ] tmux 快捷键
- [ ] vim 快捷键
- [ ] YCM 插件配置文件自动生成
- [ ] Install neovim
- [ ] Install vim
- [ ] Plugin List for vim
- [ ] solarise color
- [ ] Color theme
- [ ] vim && iterm theme 
- - -

# env-install
> linux 终端开发环境安装：zsh expect tmux vim neovim gcc、poweeline、ack-grep等  
> 下面图片是：ZSH_THEME="agnoster"、solarise配色、vim、tmux、poerline共同效果图　
![zsh](https://raw.githubusercontent.com/leeqx/env-install/master/zsh_tmux.png)
![vim](https://raw.githubusercontent.com/leeqx/env-install/master/vim02.png)
![vim-tmux](https://raw.githubusercontent.com/leeqx/env-install/master/vim-tmux.png)
- - -
## 安装说明
0. clone project
0. cd env-install
0. sudo bash ./install.sh 0     --不会更新linux 软件源  
0. sudo bash ./install.sh 1     --会更新linux 软件源 
0. 打开vi 输入以下命令安装vim相关插件     --会更新linux 软件源  
     :PluginInstall	
0. 配置 
  0. 如果使用的nvim那么需求修改~/.config/nvim/init.xml根据自己的路径进行调整;  
  ```vim  
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.config/nvim/bundle/Vundle.vim
     下面这两行换成自己对应的路径
    source /Users/nano/project/env-install/vimcommon.vim
    let g:python_host_prog='/Users/nano/virtual_env/neovim/bin/python'
  ```  
  
  0. 如果是vim 则需要改~/.vimrc在配置中加上如下几行即可  
  ```vim  
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    " maybe you need add manual: source vimcommon.conf
    "
    " And vim plugin will intall at ~/.vim/bundle/
    source /Users/nano/project/env-install/vimcommon.vim
  ```  
  
0. 进入到~/.vim/bundle/YouCompleteMe,然后执行命令：`install.py --clang-completer --gocode-completer` 编译YCM 
0. 如果想要使用solarised 终端配色,进入到如下目录：  
  ```shell
   cd env-install/gnome-terminal-colors-solarized
   bash set_dark.sh
  ```
0. 更改终端字体看需要选择一种带有powerline的字体即可
0. reboot 系统

to install developer tools :git expect tmux vim-plugins neovim
- - -
## tmux 快捷键
  0. 启动tmux  
     tm ＃前提是设置了`alias tm='tmux -2'`  

  0. 新建session  
     `Ctrl+t+c `  

  0. session跳转  
     `Ctrl＋t＋n`(数字)　跳转到第几个session  
  0. 分屏session  
     `Ctrl+t+-` 水平分屏  
     `Ctrl+t+| `垂直分屏  
     分屏之间跳转`Ctrl+t+o`  
  0. 滚屏  
     `Ctrl＋t＋［`  
     然后可以使用vim快捷店 `h、j、k、l`上下左右移动  
     在滚屏模式下，v 进入选择模式采用以上键移动，然后y复制退出滚屏模式  　
     `Ctrl＋t＋］`粘贴刚复制的内容  
  0. 最大化   
     `Ctrl + t + z `可以使的当前分窗口最大化，再输入一次则可以恢复  　　 
  0. session rename
     `Ctrl + t +,

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
  0. tabular 插件
    :Tab / = 
    表示代码按照=号进行对齐
    :10,5 Tab / =
    表示第10行到第10+5行代码按照=号进行对齐
  0. 文件内容搜索  （linux)
    在normal模式下，命令：`Ack foo` 即会搜索当前目录下所有包含foo的行，通过 j,k上下移动,o 可以打开，想要跳转回原来的地方参考上一个快捷键。  
    需要额外安装ack-grep,在ubuntu/debain/linux-mint:
    `sudo apt-get install ack-grep`
    在macos
    `brew install ack`
- - - 
 ## YCM 插件配置文件自动生成
  > YCM-GENERATOR usage
    > Run ./config_gen.py PROJECT_DIRECTORY, where PROJECT_DIRECTORY is the root directory of your project's build system (i.e. the one containing the root Makefile, etc.)
    > You can also invoke it from within Vim using the :YcmGenerateConfig or :CCGenerateConfig commands to generate a config file for the current directory.
    > These commands accept the same arguments as ./config_gen.py, but do not require the project directory to be specified (it defaults to the current working direc
    > or run ~/.config/nvim/bundle/YCM-Generator/config_gen.py(neovim) PROJECT_DIRECTORY to create YCM-config file
    > or run ~/.vim/bundle/YCM-Generator/config_gen.py(vim) PROJECT_DIRECTORY to create YCM-config file

## Install neovim  
  see https://github.com/neovim  
  python module for neovim  
  https://neovim.io/doc/user/nvim_python.html  

  0. For linux  
    sudo apt-get install python-virtualenv
    mkvirtualenv neovim
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
     
### vim install  
  [vim install](https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/)  
  compile VIM from source to support YCM：  
  git clone https://github.com/vim/vim.git  
   想从源码编译支持YCM那么需要：
   ```shell
 sudo apt-get install libncurses5-dev
 ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes
  sudo make install
  ```
## Plugin List    
  ```vim
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'oblitum/YouCompleteMe' , { 'do': './install.py --clang-completer' }
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
"Plugin 'bbchung/clighter'
Plugin 'troydm/zoomwintab.vim'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'
Plugin 'jacobsimpson/nvim-terminal-velocity'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'xolox/vim-misc'
Plugin 'vim-scripts/bash-support.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/indent-motion'
Plugin 'google/vim-ft-go'
Plugin 'dongweiming/vary.vim' " 保存是自动去掉行尾空格，tab转空格
Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable'} "ＹＣＭ　配置文件生成工具"
```
### QA
  0. YCM support libs too old, PLEASE RECOMPILE？  
    A：Please remove`~/.config/nvim/bundle/YouCompleteMe/` or `~/.vim/bundle/YouCompleteMe/`  
    then open vim or nvim do `:PluginInstall` to reinstall YCM  

### solarise color

```vim
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
     [**solarized-theme**](https://github.com/altercation/solarized/)  
