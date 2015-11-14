# env-install
to install devleper tools :git expect tmux vim-plugins 

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

## Install neovim 
see https://github.com/neovim  
python module for neovim  

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

