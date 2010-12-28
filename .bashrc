# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
PS1='\[\033[0;36m\]$(date "+%l:%M%p")\n\[\033[01;32m\][\[\033[01;34m\]\w\[\033[01;32m\]]\n\[\033[01;34m\](\[\033[01;32m\]\u@\h\[\033[01;34m\]) $\[\033[00m\] '

