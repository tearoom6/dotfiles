# ~/.zshrc
# zsh Personal Preference File @tearoom6

# Custom Functions
fpath=($HOME/.zsh.d/functions/ $fpath)
autoload -Uz try_eval

# Basics
export LANG='en_US.UTF-8'
export TZ='Asia/Tokyo'
#export TZ='Asia/Dubai'
#export TZ='Asia/Singapore'
#export TZ='Australia/Hobart'
#export TZ='Australia/Sydney'
#export TZ='Europe/London'
#export TZ='Pacific/Auckland'
#export TZ='Pacific/Noumea'
export EDITOR='vim'
REPORTTIME=5
setopt NO_CLOBBER
bindkey -e

# Navigation
setopt AUTO_CD
setopt AUTO_PUSHD

# Expansion / Globbing
setopt EXTENDED_GLOB
setopt GLOB_DOTS
setopt MARK_DIRS
setopt NULL_GLOB

# Completion
fpath=($HOME/.zsh.d/completions/ $fpath)
#setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_PARAM_KEYS
setopt AUTO_PARAM_SLASH
setopt LIST_TYPES
autoload -Uz compinit && compinit -i
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
LISTMAX=100
HISTORY_IGNORE='(ls|pwd|exit)'
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

# User I/O
setopt CORRECT_ALL
setopt IGNORE_EOF
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP

# Prompt
setopt PROMPT_SUBST
autoload -Uz colors && colors
autoload -Uz vcs_info
zstyle ":vcs_info:*" enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr "%F{red}*"
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}+"
zstyle ':vcs_info:git:*' actionformats '%F{yellow}[%s:%r:%b|%a]%f%u%c'
zstyle ':vcs_info:git:*' formats       '%F{yellow}[%s:%r:%b]%f%u%c'
precmd () { vcs_info }
PR_TIME='${fg[yellow]}%*${reset_color}'
PR_USER='${fg[red]}%n${reset_color}'
PR_HOST='${fg[white]}%m${reset_color}'
PR_CWD='${fg[green]}%~${reset_color}'
PR_VCS='${vcs_info_msg_0_}%f'
PROMPT="${PR_TIME} ${PR_USER}@${PR_HOST}:${PR_CWD}${PR_VCS}
%(!.#.$) "

# Aliases
## ls
case `uname -s` in
'Darwin')
   alias ls='ls -F -G'
   ;;
'Linux')
   alias ls='ls -F --color=auto --time-style=+%Y-%m-%d\ %H:%M:%S'
   ;;
esac
alias ll='ls -l'
alias la='ll -a'
## grep
alias grep='grep --color=auto'


# Applications
## Less
export LESSCHARSET='UTF-8'
## direnv
eval "$(try_eval direnv hook bash)"
## anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(try_eval anyenv init -)"
## SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] && . "$SDKMAN_DIR/bin/sdkman-init.sh"
## Go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"
## OPAM
eval "$(try_eval opam config env)"
## Linuxbrew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
## Poetry
export PATH="$HOME/.poetry/bin:$PATH"
## Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
## MySQL
export PATH=$PATH:/usr/local/mysql/bin
## TravisCI
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh


# Login Message
## Play
try_eval fortune | try_eval cowthink
