# .bashrc

# This is my bashrc file. It has several things I find useful and will most likely 
# grow with time.

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# set VIM as my default text editor
export EDITOR=vim

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable bash_completion if available
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# User specific aliases and functions
PS1='\[\033[0;36m\]$(date "+%H:%M") \[\033[01;32m\][\[\033[01;34m\]\w\[\033[01;32m\]]\n\[\033[01;34m\](\[\033[01;32m\]\u@\h\[\033[01;34m\]) $\[\033[00m\] '

