# ==========================================================================
#  yano's .zshrc
#  (heavily borrowed from paradigm)
# ==========================================================================

# ==========================================================================
#  general zsh settings
# ==========================================================================

# Path to my oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Name of theme
ZSH_THEME="yano"

# oh-my-zsh plugins
plugins=(git python _pip battery)

source $ZSH/oh-my-zsh.sh

# new files default to only owner having rwx
umask 002

# cd into directory just by directory name
setopt autocd

# prompt to correct typos
setopt correct

# don't propose _shellfunctions when correcting
CORRECT_IGNORE='_*'

# additional glob options
setopt extendedglob

# shut up
setopt nobeep

# don't change nice for bg tasks
setopt nobgnice

# don't use ctrl-s/q to control program flow
setopt noflowcontrol

# disable flow control completely
stty -ixon

# don't record repeated things in history
setopt histignoredups

# allows comments in commands
setopt interactivecomments  

# extended globbing
setopt extendedglob

# consider / a word break, for ctrl-w
WORDCHARS=${WORDCHARS//\/}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#  custom zle widgets
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

# prepend sudo
prepend-sudo() {
    if [[ $BUFFER != "sudo "* ]]; then
        BUFFER="sudo $BUFFER"; CURSOR+=5
    fi
}
zle -N prepend-sudo

# prepend vim
prepend-vim() {
    if [[ $BUFFER != "vim "* ]]; then
        BUFFER="vim $BUFFER"; CURSOR+=5
    fi
}
zle -N prepend-vim

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#  other custom functions
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

# cd into a directory then immediately ls
cds() {
    cd $1 && ls
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#  keybindings
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

# vi-style keybindings
bindkey -v

# vi-backward-kill-word
bindkey "^W" backward-kill-word

# vi-backward-delete-char
bindkey "^H" backward-delete-char

# vi-kill-line
bindkey "^U" backward-kill-line

# vi-backward-delete-char
bindkey "^?" backward-delete-char

# temporarily save line contents
bindkey "^Y" push-line

# ctrl-p to go pull up last line
bindkey "^P" up-line-or-history

# ctrl-n to go pull up next line
bindkey "^N" down-line-or-history

# search in history
bindkey -M viins "^R" history-incremental-search-backward

# insert-mode ctrl-e end of line
bindkey -M viins "^E" end-of-line

# insert mode, then ctrl-e
bindkey -M vicmd "^E" vi-add-eol

# insert-mode ctlr-a beg of line
bindkey -M viins "^A" beginning-of-line

# undo last undo
bindkey -M vicmd "^R" redo

# show cursor position info
bindkey -M vicmd "ga" what-cursor-position

# swap case over movement
bindkey -M vicmd "g~" vi-oper-swap-case

# no escape timeout viins
bindkey -rpM viins '^['

# no escape timeout vicmd
bindkey -rpM vicmd '^['

# prepend sudo
bindkey "^S" prepend-sudo

# prepend vim
bindkey "^V" prepend-vim

# delete block
bindkey -M vicmd "di" delete-in

# delete block, go viins
bindkey -M vicmd "ci" change-in

# delete block
bindkey -M vicmd "da" delete-around

# delete block, go viins
bindkey -M vicmd "ca" change-around

# incremement number under cursr
bindkey -M vicmd "^A" increment-number

# incremement number under cursr
bindkey -M vicmd "^X" decrement-number

# ==========================================================================
#  environmental variables
# ==========================================================================

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#  general settings
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

# Sets vim as editor
export EDITOR="vim"

# sets zsh as shell
export SHELL="/bin/zsh"

# ensures programs know to use 256-colors
if [[ $TERM == "xterm" ]]; then
    export TERM="xterm-256color"
elif [[ $TERM == "screen" ]]; then
    export TERM="screen-256color"
fi

# sets vim as pager
export PAGER="sh -c \"col -b | vim -M -c 'set nonu ft=man nomod nolist titlestring=MANPAGE' -\""

# set PDF reader
export PDFREADER="evince"
export PDFVIEWER="evince"

TZ="America/New_York"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#  misc
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

# quick access to RAMdisk
vv="/dev/shm/"

# ==========================================================================
#  aliases
# ==========================================================================

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#  new commands
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

# clear the screen, then ls
alias cls="clear;ls"

# search entire filesystem, ignore errors
alias finds="find / -name 2>/dev/null"

# take ownership of file/folder
alias mine="sudo chown -R "`whoami`:`whoami`
#
# allow others to read/execute
alias yours="sudo find . -perm -u+x -exec chmod a+x {} \; && sudo find . -perm -u+r -exec chmod a+r {} \;"

# resume work on a LaTeX project
alias rtex="$PDFREADER *.pdf& vim *.tex"

# where am I? (due to minimal shell prompt...)
alias wai='echo $(uname -n) $SCHROOT_CHROOT_NAME$CHROOT_NAME'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#  general short commands
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

alias ta="tmux attach"
alias s="sudo"
alias v="vim"
alias vs="vim --servername vim"
alias sx="startx& exit"
alias :wq="exit"
alias :q="exit"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias vv="cd /dev/shm/"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#  set default flags
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

alias ls="ls --color=auto -h  --group-directories-first"
alias la="ls -A --color=auto -h --group-directories-first"
alias ll="ls -lA --color=auto -h  --group-directories-first"
alias du="du -hs"
alias df="df -h"
alias xpdfr="xpdf -remote 127.0.0.1"
alias xpdfv="xpdf -rv"
alias grep="grep -IR --color=yes -D skip --exclude-dir=.git"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#  git
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

alias gc="git commit -a -v"
alias gb="git branch"
alias gl="git log --graph --color | less -R"
alias gr="git reset --hard HEAD"
alias gs="git status"
alias gw="git show"
alias gco="git checkout"
alias gm="git merge"
alias gus="git push"
alias guss='git push origin $(git branch | awk '\''/^\*/{print$2}'\'')'
alias gul="git pull"
alias gull='git pull origin $(git branch | awk '\''/^\*/{print$2}'\'')'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#  package management
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

if [ -f /etc/slackware-version ]; then
    DISTRO="Slackware"
elif [ -f /etc/gentoo-release ]; then
    DISTRO="Gentoo"
else
    DISTRO=$(awk '/[:alpha:]/ { print $1; exit }' /etc/issue 2>/dev/null)
fi
if [[ $DISTRO == "Debian" || $DISTRO == "Ubuntu" ]]; then
    alias kb="dpkg -S"
    alias kc="sudo apt-get --purge autoremove"
    alias ki="sudo apt-get install"
    alias kl="dpkg -l"
    alias kr="sudo apt-get --purge remove"
    alias ks="apt-cache search"
    alias ku="sudo apt-get update && sudo apt-get upgrade"
    alias kw="apt-cache show"
elif [[ $DISTRO == "Arch" ]]; then
    alias kb="pacman -Qo"
    alias kc='sudo pacman -Sc && for PKG in `pacman -Qqtd`; do sudo pacman -Rs $PKG; done'
    alias ki="sudo pacman -S"
    alias kl="pacman -Q"
    alias kr="sudo pacman -R"
    alias ks="pacman -Ss"
    alias ku="sudo pacman -Syu"
    alias kw="pacman -Si"
elif [[ $DISTRO == "Fedora" ]]; then
    alias kb="rpm -qa"
    alias kc="sudo yum clean all"
    alias ki="sudo yum install"
    alias kl="yum list installed"
    alias kr="sudo yum remove"
    alias ks="yum search"
    alias ku="sudo yum update"
    alias kw="yum info"
elif [[ $DISTRO == "Slackware" ]]; then
    alias ki="sudo slackpkg install"
    alias kr="sudo slackpkg remove"
    alias ks="sudo slackpkg search"
    alias ku="sudo slackpkg update && slackpkg install-new && slackpkg upgrade-all"
elif [[ $DISTRO == "Gentoo" ]]; then
    alias ks="emerge --search"
    alias kS="emerge --searchdesc"
    alias ki="emerge"
    alias ku="emerge --update --ask world"
    alias kU="emerge --update --deep --newuse world"
    alias kc="emerge --depclean"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#  global aliases
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

alias gcc='colorgcc'
alias ta='tmux attch -d'
alias idle='ssh -fCND 127.0.0.1:54321 idle'
alias de='ssh -fCND 127.0.0.1:12345 de'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#  run-with-command
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

alias -s html=$BROWSER
alias -s htm=$BROWSER
alias -s org=$BROWSER
alias -s php=$BROWSER
alias -s com=$BROWSER
alias -s edu=$BROWSER
alias -s txt=$EDITOR
alias -s tex=$EDITOR
alias -s pdf=xpdf
alias -s gz=tar -xzvf
alias -s bz2=tar -xjvf

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#  nocorrect
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

alias mkdir="nocorrect mkdir"
alias cp="nocorrect cp"
alias mv="nocorrect mv"
alias ln="nocorrect ln"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#  virtualenv
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=~/virtual_envs
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
    source /usr/local/bin/virtualenvwrapper.sh
fi

## SSH-AGENT

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

