## Vbundle help

you can add some new plugin by vbunle like this ways:(add them on you ~/.vim then run:PluginInstall in vim)

    " set the runtime path to include Vundle and initialize  
    set rtp+=~/.vim/bundle/Vundle.vim  
    call vundle#begin()  
    " alternatively, pass a path where Vundle should install plugins  
    "call vundle#begin('~/some/path/here')  
      
    " let Vundle manage Vundle, required  
    Plugin 'gmarik/Vundle.vim'  
      
    " The following are examples of different formats supported.  
    " Keep Plugin commands between vundle#begin/end.  
    " plugin 来源1:gitHub上的库名（需要hosted名的格式）  
    Plugin 'tpope/vim-fugitive'  
    " plugin 来源2: http://vim-scripts.org/vim/scripts.html上的插件名  
    Plugin 'L9'  
    " 来源3: gitHub上的git库（不需要hosted名的格式）  
    Plugin 'git://git.wincent.com/command-t.git'  
    " 来源4:本地机器上的git库  
    Plugin 'file:///home/gmarik/path/to/plugin'  
    " 来源5: 某个库的子目录  
    " Pass the path to set the runtimepath properly.  
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}  
    " 当有两个同名的插件时，还可以通过下面的方式来避开名字冲突  
    Plugin 'user/L9', {'name': 'newL9'}  
      
    " All of your Plugins must be added before the following line  
    call vundle#end()            " required  
    
    filetype plugin indent on    " required  
    " To ignore plugin indent changes, instead use:  
    "filetype plugin on  
    "  
    " Brief help  
    " :PluginList          - list configured plugins  
    " :PluginInstall(!)    - install (update) plugins  
    " :PluginSearch(!) foo - search (or refresh cache first) for foo  
    " :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins  
    "  
    " see :h vundle for more details or wiki for FAQ  
    " Put your non-Plugin stuff after this line  
