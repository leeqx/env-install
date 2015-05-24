# Path to your oh-my-zsh installation.
export ZSH=/Users/nano/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerline"
ZSH_THEME="agnoster-new"
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

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/3rd/bin/:/usr/local/3rd/share/:/Users/nano/bin/:/usr/local/Cellar/tmux/1.9a/bin:/usr/local/Cellar/gcc49/4.9.2/bin:/usr/local/Cellar/lua/5.2.3_1/bin/:/usr/local/Cellar/luajit/2.0.3_1/bin:/usr/local/Cellar/unrar/5.2.3/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source ~/.vim/bundle/tmux-powerline/powerline.zsh 
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
# else
#   export EDITOR='mvim'
 fi

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
alias ls='ls -lh'
alias ll='ls -lh'
alias tm='tmux -2'
alias tml='tmux -l'
alias oi='set -o vi'
oi
tm
#alias g++='g++-4.9'
#alias gcc='gcc-4.9'
#alias cpp='cpp-4.9'
#alias c++='c++-4.9'
#alias ar='gcc-ar'
#alias nm='gcc-nm'
export PATH=${PATH}:/usr/local/3rd/bin/:/usr/local/3rd/share/:/Users/nano/bin/:/usr/local/Cellar/tmux/1.9a/bin:/usr/local/Cellar/gcc49/4.9.2/bin:/usr/local/Cellar/lua/5.2.3_1/bin/:/usr/local/Cellar/luajit/2.0.3_1/bin:/usr/local/Cellar/unrar/5.2.3/bin

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/3rd/leveldb/:/usr/local/3rd/lib/:/usr/local/Cellar/cloog018/0.18.0/lib:/usr/local/Cellar/gmp4/4.3.2/lib:/usr/local/Cellar/mpfr2/2.4.2/lib/:/usr/local/Cellar/libmpc08/0.8.1/lib/:/usr/local/Cellar/lua/5.2.3_1/lib/:/usr/local/Cellar/luajit/2.0.3_1/lib:/usr/local/Cellar/unrar/5.2.3/lib/:/usr/lib

#PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
