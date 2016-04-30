# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
setopt AUTO_CD

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerline"
ZSH_THEME="agnoster"
#ZSH_THEME="kolo"
export TERM="xterm-256color"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/3rd/bin/:/usr/local/3rd/share/:/usr/local/Cellar/tmux/1.9a/bin:/usr/local/Cellar/gcc49/4.9.2/bin:/usr/local/Cellar/lua/5.2.3_1/bin/:/usr/local/Cellar/luajit/2.0.3_1/bin:/usr/local/Cellar/unrar/5.2.3/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias ls='ls -lh '
alias ll='ls -lh '
alias tm='tmux -2 -f ~/.tmux.conf'
alias tml='tmux -l'
alias oi='set -o vi'
alias sh='/usr/bin/zsh'
alias docker='sudo docker '
alias sh='bash'
oi

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
function runTmux () {
    os=`uname`
    if [ "$os"="Linux" ];then
        tmuxHasRun=`ps -C tmux|grep -v CMD|grep -v defunct|grep -v grep`
    else
        tmuxHasRun=`ps tmux|grep -v CMD|grep -v defunct|grep -v grep`
    fi
    if [ -z "$tmuxHasRun" ];then
        echo -e "\033[32;1m tmux not run,now running new \033[0m"
        tm 
    else
        echo -e "\033[32;1m tmux already run,now attatch\033[0m"
        tmux attach
    fi
}
runTmux
function configNvim() {
    if [ -e /usr/local/bin/nvim ];then
        alias vi='/usr/local/bin/nvim -u ~/.config/nvim/init.vim'
    elif [ -e /usr/bin/nvim ];then
        alias vi='/usr/bin/nvim -u ~/.config/nvim/init.vim'
    fi
    if [ -e $HOME/virtual_env/neovim/bin/activate ];then
        source "$HOME/virtual_env/neovim/bin/activate"
        export WORKON_HOME="$HOME/virtual_env/"
    fi
    if [[ -n $SSH_CONNECTION ]]; then
        export EDITOR='vi'
        bindkey -v 
    else
        export EDITOR='vi'
    fi
}
function configGrep () {
    has_ack=`which ack-grep|grep -v not|grep -v grep`
    if [ ! -z "$has_ack" ];then
        alias grep='ack-grep --color -in'
    else
        alias grep='grep --color=auto -in'
    fi
}
# use ctrl-z instead of fg 
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
configNvim
configGrep

