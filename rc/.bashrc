
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


#----------------------------------------------------------------------
# Command Prompt Format
#----------------------------------------------------------------------
#
# start with:\e[
# end with:\e[m
#
# colors:
#
# Black 0;30
# Blue  0;34
# Green 0;32
# Cyan  0;36
# Red   0;31
# Purple    0;35
# Brown 0;33
# Blue  0;34
# Green 0;32
# Cyan  0;36
# Red   0;31
# Purple    0;35
# Brown 0;33
# hostname ip-10-110-75-190
# export PS1="[\u@\h \W]\$ "


# Define some colors first:
RED='\e[1;31m'
GREEN='\e[1;32m'
BLUE='\e[1;34m'
CYAN='\e[1;36m'
NC='\e[0m'              # No Color

#export PS1="[\u@\H]\$ "
#export PS1="\e[0;32m[\u@\H]\$ \e[m"
#export PS1="\e[0;32m[\u@\H]\$ \e[m"
#export PS1="$green[\D{%Y-%m-%e %H:%M:%S}] \u@$cyan\H$NC:\w$ $NC"
#export PS1="$ "

unset MAILCHECK         # Do not want my shell to warn me of incoming mail.


#----------------------------------------------------------------------
# UTILITY FUNCTIONS
#----------------------------------------------------------------------

function xtitle()      # Adds some text in the terminal frame.
{
    case "$TERM" in
        *term | rxvt)
            echo -n -e "\033]0;$*\007" ;;
        *)  
            ;;
    esac
}

function swap()  # Swap 2 filenames around, if they exist
{                #(from Uzi's bashrc).
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

function extract()      # Handy Extract Program.
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


#----------------------------------------------------------------------
# Settings
#----------------------------------------------------------------------

export INPUTRC=~/.inputrc


#----------------------------------------------------------------------
# History Across Session
#----------------------------------------------------------------------

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups           # No Duplicate History
export HISTSIZE=100000                            # Big History Size
export HISTFILESIZE=100000                        # Big History File
#export HISTTIMEFORMAT="[%Y-%m-%d - %H:%M:%S] "    #
shopt -s histappend                               # Append to History

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


#----------------------------------------------------------------------
# Command Editors
#----------------------------------------------------------------------

set -o emacs # uncomment this for emacs mode
#
# ctrl-a     Move cursor to beginning of line
# ctrl-e     Move cursor to end of line
# meta-b     Move cursor back one word
# meta-f     Move cursor forward one word
# ctrl-w     Cut the last word
# ctrl-u     Cut everything before the cursor
# ctrl-k     Cut everything after the cursor
# ctrl-y     Paste the last thing to be cut
# ctrl-_     Undo

# set -o vi # uncomment this for vim mode
#
# h  Move cursor left
# l  Move cursor right
# A  Move cursor to end of line and put in insert mode
# 0  (zero) Move cursor to beginning of line (doesn't put in insert mode)
# i  Put into insert mode at current position
# a  Put into insert mode after current position
# dd     Delete line (saved for pasting)
# D  Delete text after current cursor position (saved for pasting)
# p  Paste text that was deleted
# j  Move up through history commands
# k  Move down through history commands
# u  Undo


#----------------------------------------------------------------------
# Personal Alias
#----------------------------------------------------------------------

alias du='du -kh'              # Makes a more readable output.
alias mkdir='mkdir -p'
alias ls='ls --color=auto'
alias grep='egrep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias now='date +\"%Y%m%d.%H%M%S\"'
alias today='date +\"%Y%m%d\"'
alias h='history'
alias pjson='python -mjson.tool'


#----------------------------------------------------------------------
# Screen
#----------------------------------------------------------------------

#if [ -z "$STY" ]; then
    #exec screen -dR
#fi


#----------------------------------------------------------------------
# Git Global Config
#----------------------------------------------------------------------

# https://github.com/trufa/git-cheatsheet
# http://ndpsoftware.com/git-cheatsheet.html

git config --global color.ui true
git config --global push.default current ## Change to simple when git is upgraded
git config --global alias.lg "log --abbrev-commit --decorate --graph --all --pretty=format:'%C(magenta)%h%C(reset) -%C(yellow)%d%C(reset) %s %C(green)(%cr) %C(cyan)<%an>%C(reset)'"
git config --global diff.tool vimdiff
git config --global difftool.prompt false

