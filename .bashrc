# ~/.bashrc
# bash Personal Preference File @tearoom6

# Utility
## load functions
if ! type is_utility_loaded >/dev/null 2>&1; then
   . ~/.bash.d/utility.sh
fi

# Bash Customize
## Completion
if [ -f ~/.bash.d/bash-completion/bash_completion ]; then
   BASH_COMPLETION=~/.bash.d/bash-completion/bash_completion
   BASH_COMPLETION_DIR=~/.bash.d/bash-completion/completions
   BASH_COMPLETION_COMPAT_DIR=~/.bash.d/bash-completion/completions
   . ~/.bash.d/bash-completion/bash_completion
fi
## Before Prompt
export PROMPT_COMMAND='try_exec dispatch "PROMPT_COMMAND_"'
## Prompt
PR_TIME=`try_exec decorate txtylw \\\\\\\t`
PR_USER=`try_exec decorate bldred \\\\\\\u`
PR_HOST=`try_exec decorate bldwht \\\\\\\h`
PR_CWD=`try_exec decorate bldgrn \\\\\\\w`
PR_YLW=`try_exec decorate bldylw`
PR_RCT=`try_exec decorate txtrst`
if [ -f ~/.git.d/git-prompt.sh -a -f ~/.git.d/git-completion.bash ]; then
   source ~/.git.d/git-prompt.sh
   source ~/.git.d/git-completion.bash
   GIT_PS1_SHOWDIRTYSTATE=true
   GIT_PS1_SHOWSTASHSTATE=true
   GIT_PS1_SHOWUNTRACKEDFILES=true
   GIT_PS1_SHOWUPSTREAM=auto
   export PS1="$PR_TIME $PR_USER@$PR_HOST:$PR_CWD"'$(__git_ps1 "$PR_YLW[%s]$PR_RCT")'"\n\$ "
else
   export PS1="$PR_TIME $PR_USER@$PR_HOST:$PR_CWD\n\$ "
fi

# Alias Definitions
## ls
case `try_exec get_os_name` in
'MacOSX')
   alias ls='ls -F -G'
   ;;
'Linux')
   alias ls='ls -F --color=auto --time-style=+%Y-%m-%d\ %H:%M:%S'
   ;;
esac
alias ll='ls -l'
alias la='ll -a'
## cd
alias home='cd ~'
## grep
alias grep='grep --color=auto'
## sudo
## define to avoid error that __git_ps1 not found when using sudo su
## using the hack that options or arguments can be expanded,
## if inserting space at the last of alias definition
alias sudo='sudo '
alias su='su -'
# local environment
alias setup='~/setup.sh'

# Application Config
## Terminal
case $TERM in
kterm*|xterm*)
   export PROMPT_COMMAND_TERMINAL='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD##*/}\007"'
   ;;
esac
## direnv
eval "$(try_exec direnv hook bash)"
## TravisCI
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# Login Message
## Play
try_exec fortune | try_exec cowthink

