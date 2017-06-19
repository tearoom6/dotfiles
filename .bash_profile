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
export TZ='Asia/Tokyo'
export EDITOR='vim'

# History Config
export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTCONTROL=ignoreboth
export HISTIGNORE=?:??:exit

# Application Config
## Less
export LESSCHARSET='UTF-8'
## Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
## Maven
export M2_HOME=/usr/local/apache-maven/apache-maven-3.2.5
export M2=$M2_HOME/bin
export MAVEN_OPTS='-Xms256m -Xmx512m'
export PATH=$M2:$PATH
## Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
export ANDROID_NDK=$HOME/Library/Android/ndk-r12b
export PATH=$ANDROID_NDK:$PATH
## MySQL
export PATH=$PATH:/usr/local/mysql/bin
## anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(try_exec anyenv init -)"
## nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(try_exec nodenv init -)"
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

# Load .bashrc
if [ -f ~/.bashrc ]; then
   . ~/.bashrc
fi
