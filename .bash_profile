# ~/.bash_profile
# bash Personal Preference File @tearoom6

# Utility
## load functions
. ~/.bash.d/utility.sh

# Path Definition
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=~/.bash.d:$PATH

# Basic Config
export LANG='en_US.UTF-8'
#export TZ='Africa/Tunis'
export TZ='Asia/Tokyo'
#export TZ='Asia/Dubai'
#export TZ='Asia/Singapore'
#export TZ='Australia/Hobart'
#export TZ='Australia/Sydney'
#export TZ='Europe/Istanbul'
#export TZ='Europe/London'
#export TZ='Pacific/Auckland'
#export TZ='Pacific/Noumea'
export EDITOR='vim'

# History Config
export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTCONTROL=ignoreboth
export HISTIGNORE=?:??:exit

# Application Config
## Less
export LESSCHARSET='UTF-8'
## GPG
export GPG_TTY=$(tty)
## anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(try_exec anyenv init -)"
## SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] && . "$SDKMAN_DIR/bin/sdkman-init.sh"
## Go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"
## OPAM
eval "$(try_exec opam config env)"
## Linuxbrew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
## Poetry
export PATH="$HOME/.local/bin:$PATH"
## Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
## MySQL
export PATH=$PATH:/usr/local/mysql/bin

# Load .bashrc
if [ -f ~/.bashrc ]; then
   . ~/.bashrc
fi

