# ==========================================================================
#  yano's .zshrc
#  (heavily borrowed from paradigm)
# ==========================================================================

# ==========================================================================
#  general zsh settings
# ==========================================================================

autoload -U colors && colors

PROMPT="%{$fg[green]%}%B[%*]%{$reset_color%} %{$fg_bold[cyan]%}%B%n%{${fg_bold[blue]}%}::%{$reset_color%}%{$fg[yellow]%}%B%m%{$reset_color%} %{$fg_no_bold[magenta]%}➜ %{$reset_color%} %{${fg[green]}%}%B%3~ %{${reset_color}%} %{${fg_bold[blue]}%}»%{${reset_color}%} "

setopt histignorealldups sharehistory

# shut up
setopt nobeep

# don't correct me
unsetopt correct_all

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# completion
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# ==========================================================================
#  environmental variables
# ==========================================================================

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#  general settings
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Sets vim as editor
export EDITOR="vim"

# sets zsh as shell
#export SHELL="/bin/zsh"

# ensures programs know to use 256-colors
#if [[ $TERM == "xterm" ]]; then
#    export TERM="xterm-256color"
#elif [[ $TERM == "screen" ]]; then
#    export TERM="screen-256color"
#fi

# sets vim as pager
export PAGER="sh -c \"col -b | vim -M -c 'set nonu ft=man nomod nolist titlestring=MANPAGE' -\""

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

# search entire filesystem, ignore errors
alias finds="find / -name 2>/dev/null"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#  general short commands
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

alias s='sudo'
alias v='vim'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias vv='cd /dev/shm/'
alias lii='ls -hal | grep -i'
alias mc='java -jar ~/downloads/minecraft.jar'
alias stall='ssh -2 -fXND 127.0.0.1:54321 stall'
alias de='ssh -2 -fXND 127.0.0.1:54322 de'
alias home='ssh -2 -fXND 127.0.0.1:30311 home'
alias fish='ssh -2 -fND 127.0.0.1:54321 fish'
alias dedi='ssh -2 -fND 127.0.0.1:54324 dedi'
alias chmow='chmod'
alias chmog='chmod'
alias myip='curl https://wtfismyip.com/text'
alias myip4='curl https://ipv4.wtfismyip.com/text'
alias myip6='curl https://ipv6.wtfismyip.com/text'
alias rot13='tr 'a-zA-Z' 'n-za-mN-ZA-N''
alias clippy='xclip -i -sel clip'

if [ -f /usr/bin/colordiff ]; then
    alias diff='colordiff'
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#  set default flags
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

alias ls='ls --color=yes -h'
alias la='ls -A --color=yes -h'
alias ll='ls -lA --color=yes -h'
alias du='du -hs'
alias df='df -h'
alias grep='grep --color=yes'
alias zgrep='zgrep --color=yes'
alias egrep='egrep --color=yes'
alias gcc='colorgcc'
alias mv='mv -i'
alias cp='cp -i'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#  package management
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if [ -f /etc/slackware-version ]; then
    DISTRO="Slackware"
elif [ -f /etc/gentoo-release ]; then
    DISTRO="Gentoo"
elif [ -f /etc/linuxmint/info ]; then
    DISTRO="Mint"
else
    DISTRO=$(awk '/[:alpha:]/ { print $1; exit }' /etc/issue 2>/dev/null)
fi
if [[ $DISTRO == "Debian" || $DISTRO == "Ubuntu" || $DISTRO == "Mint" ]]; then
    alias kb="dpkg -S"
    alias kc="sudo aptitude --purge autoremove"
    alias ki="sudo aptitude install"
    alias kl="dpkg -l"
    alias kr="sudo aptitude --purge remove"
    alias ks="aptitude search"
    alias ku="sudo aptitude update && sudo aptitude upgrade"
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
elif [[ $DISTRO == "Fedora" || $DISTRO == "CentOS" ]]; then
    alias kb="rpm -qa"
    alias kc="sudo yum clean all"
    alias ki="sudo yum install"
    alias kl="yum list installed"
    alias kr="sudo yum remove"
    alias ks="yum search"
    alias ku="sudo yum update"
    alias kw="yum info"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# virtualenv
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=$HOME/dev
export VIRTUALENV_ROOT=$WORKON_HOME

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# ssh-agent
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

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

## allow yano.firefox to create X11 windows for Firefox and other apps
xhost +SI:localuser:yano.firefox > /dev/null
## enable root to start X11 windows
xhost +si:localuser:root > /dev/null
xhost +local:root > /dev/null

function pss()
{
    ps auxf | awk 'NR == 1 || /'"${1//\//\\/}"'/'
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

if [ -f $HOME/.zshrc-work ]; then
    source $HOME/.zshrc-work
fi

#export LC_ALL=en_GB
