# ~/.bash_profile

# Path Definition
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=~/.bash.d/:$PATH

# Basic Config
export LANG='en_US.UTF-8'
export TZ='Asia/Tokyo'

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
export ANDROID_HOME=/Users/t-murota/Library/Android/sdk
export PATH=$ANDROID_HOME/tools:$PATH
## MySQL
export PATH=$PATH:/usr/local/mysql/bin
## rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Load .bashrc
if [ -f ~/.bashrc ]; then
   . ~/.bashrc
fi
