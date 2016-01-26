#licenses
export LM_LICENSE_FILE=2100@license.ece.ucsb.edu

# Basic options
export HISTCONTROL=ignoredups
export COLORFGBG='default;default'

shopt -s checkwinsize

# Aliases
alias ls='ls -h --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias svim='sudo vim'
alias h='cd'
alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../..'
alias cim='vim'
alias back='cd $OLDPWD'
alias root='sudo su'
alias runlevel='sudo /sbin/init'
alias grep='grep --color=auto'
alias dfh='df -h'
alias bim='vim'
alias v='vim'
alias vi='vim'
alias e='exit'

##################################################
# Color chart					 #
##################################################

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

# Prompt
BGREEN='\[\033[1;32m\]'
GREEN='\[\033[0;32m\]'
BRED='\[\033[1;31m\]'
RED='\[\033[0;31m\]'
BBLUE='\[\033[1;34m\]'
BLUE='\[\033[0;34m\]'
NORMAL='\[\033[00m\]'

parse_git_branch () {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }
parse_git_tag () {
      git describe --tags 2> /dev/null
  }
parse_git_branch_or_tag() {
      local OUT="$(parse_git_branch)"
        if [ "$OUT" == "(no branch))" ]; then
                OUT="($(parse_git_tag))";
                  fi
                    echo "$OUT "
                }
HOST='csil'

PS1="\\n${debian_chroot:+($debian_chroot)}${BRED}(${BRED}\w${BRED}) ${NORMAL}${NORMAL}\u${NORMAL}-${NORMAL}\${HOST}${NORMAL}${txtgrn}\$(parse_git_branch_or_tag)\n ${RED}$ ${NORMAL}"

# Paths
PATH=$PATH:${HOME}/bin:/usr/lib/wine/bin:/sbin:/usr/sbin
export PATH=$PATH:/usr/local/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/wine/lib:/usr/local/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

# X Terminal titles
case "$TERM" in
xterm*|rxvt*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
	;;
*)
	;;
esac

# Functions
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1		;;
			*.tar.gz)	tar xzf $1		;;
			*.bz2)		bunzip2 $1		;;
			*.rar)		rar x $1		;;
			*.gz)		gunzip $1		;;
			*.tar)		tar xf $1		;;
			*.tbz2)		tar xjf $1		;;
			*.tgz)		tar xzf $1		;;
			*.zip)		unzip $1		;;
			*.Z)		uncompress $1	;;
			*)			echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}
ziprm () {
	if [ -f $1 ] ; then
		unzip $1
		rm $1
	else
		echo "Need a valid zipfile"
	fi
}
psgrep() {
	if [ ! -z $1 ] ; then
		echo "Grepping for processes matching $1..."
		ps aux | grep $1 | grep -v grep
	else
		echo "!! Need name to grep for"
	fi
}

# Bash completion
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

cdls() { echo  && cd "$@" && ls -CF; }

#Always ls after a cd
alias cd='cdls'

# Tmux
export TERM="screen-256color"
#tmux set -g default-terminal "screen-256color"
#tmux set -g prefix c-a
#tmux set-window-option -g mode-keys vi
#tmux bind-key -t vi-copy 'v' begin-selection
#tmux bind-key -t vi-copy 'y' copy-selection
alias tmux="tmux -2"

# My Programs
# Linux
#alias chrome='/usr/bin/chromium-browser &'
#alias synapt='sudo synaptic &'

#Windows
alias chrome='"/cygdrive/c/Program Files (x86)/Google/Chrome/Application/chrome.exe"'

#Colorful error messages in shell
command_not_found_handle () {
  echo -e "\e[1;31m$0: $1: command not found\e[0;0m";
  return 127; #return bash's error code for command not found
}
