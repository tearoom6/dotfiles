#!/bin/bash
# utility.sh

# get os name
function get_os_name() {
   local cname=`uname`
   if [ $(echo "$cname" | grep -e '^Darwin') ]; then
      local os='MacOSX'
   elif [ $(echo "$cname" | grep -e '^Linux') ]; then
      local os='Linux'
   elif [ $(echo "$cname" | grep -e '^MINGW32_NT') ]; then
      local os='Cygwin'
   else
      local os='UNKNOWN'
   fi
   echo $os
}

# try to exec command($1)
function try_exec() {
   if type $1 2>/dev/null 1>/dev/null; then
      eval $@
   fi
}

# exec commands which is set to variables with prefix($1)
# http://qiita.com/tay07212/items/9509aef6dc3bffa7dd0c
function dispatch() {
   # save error code of exec last command
   export EXIT_STATUS="$?"
   
   local f
   for f in `eval echo "\\${!$1@}"`; do
      eval "${!f}"
   done
}

# decorate text
# if $1 and $2 given, return text($2) decorated with decocode($1) tag
# if only $1 given, return decocode($1) tag
function decorate() {
   local decocode=$1
   local text=$2
   # normal
   local txtblk='\e[0;30m'
   local txtred='\e[0;31m'
   local txtgrn='\e[0;32m'
   local txtylw='\e[0;33m'
   local txtblu='\e[0;34m'
   local txtmgn='\e[0;35m'
   local txtcyn='\e[0;36m'
   local txtwht='\e[0;37m'
   # bold
   local bldblk='\e[1;30m'
   local bldred='\e[1;31m'
   local bldgrn='\e[1;32m'
   local bldylw='\e[1;33m'
   local bldblu='\e[1;34m'
   local bldmgn='\e[1;35m'
   local bldcyn='\e[1;36m'
   local bldwht='\e[1;37m'
   # underline
   local undblk='\e[4;30m'
   local undred='\e[4;31m'
   local undgrn='\e[4;32m'
   local undylw='\e[4;33m'
   local undblu='\e[4;34m'
   local undmgn='\e[4;35m'
   local undcyn='\e[4;36m'
   local undwht='\e[4;37m'
   # blink
   local undblk='\e[5;30m'
   local undred='\e[5;31m'
   local undgrn='\e[5;32m'
   local undylw='\e[5;33m'
   local undblu='\e[5;34m'
   local undmgn='\e[5;35m'
   local undcyn='\e[5;36m'
   local undwht='\e[5;37m'
   # reverse
   local rvsblk='\e[7;30m'
   local rvsred='\e[7;31m'
   local rvsgrn='\e[7;32m'
   local rvsylw='\e[7;33m'
   local rvsblu='\e[7;34m'
   local rvsmgn='\e[7;35m'
   local rvscyn='\e[7;36m'
   local rvswht='\e[7;37m'
   # concealed
   local cclblk='\e[8;30m'
   local cclred='\e[8;31m'
   local cclgrn='\e[8;32m'
   local cclylw='\e[8;33m'
   local cclblu='\e[8;34m'
   local cclmgn='\e[8;35m'
   local cclcyn='\e[8;36m'
   local cclwht='\e[8;37m'
   # background cor
   local bakblk='\e[40m'
   local bakred='\e[41m'
   local bakgrn='\e[42m'
   local bakylw='\e[43m'
   local bakblu='\e[44m'
   local bakmgn='\e[45m'
   local bakcyn='\e[46m'
   local bakwht='\e[47m'
   # reset
   local txtrst='\e[0m'

   if [ -n "$2" ]; then
      # decorated text
      echo "${!decocode}${text}${txtrst}"
   else
      # only start / end tag
      echo "${!decocode}"
   fi
}
