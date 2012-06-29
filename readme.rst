This is a repo of my dot_files that I use across several machines.

On most machines the vim/ folder will work, however if it doesn't work, rename it to .vim/

Quick way to refresh changes to Xmodmap is by running this command: ``xmodmap ~/.Xmodmap``

To symlink everything, assuming I'm using the username 'yano' run the following command: ``ln -s ~/dot_files/.bashrc ~/.bashrc && ln -s ~/dot_files/.vimrc ~/.vimrc && ln -s ~/dot_files/vim ~/.vim && ln -s ~/dot_files/.xmodmap ~/.xmodmap && ln -s ~/dot_files/.gitconfig ~/.gitconfig``

to install oh-my-zsh:
``curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh``

install my theme
``curl https://raw.github.com/myano/oh-my-zsh/master/themes/yano.zsh-theme > ~/.oh-my-zsh/themes/yano.zsh-theme``

``ln -s ~/dot_files/.zshrc ~/.zshrc``

``aptitude update && aptitude upgrade && aptitude dist-upgrade && aptitude install sudo git vim xscreensaver unbound pidgin build-essential python-pip ipython curl nmap keepassx xpdf evince``

To use Pianobar, install it from source and then symlink the config folder.

``ln -s ~/dot_files/.config/pianobar ~/.config/``

then, ``ln -s ~/dot_files/.scrobbler-helper.conf ~/``

and if a proxy is needed (socks5):

``sudo ln -s ~/dot_files/tsocks.conf /etc/``

To setup scrobbling to libre.fm install Audio::Scrobbler,
``sudo perl -MCPAN -e 'install Audio::Scrobbler'``

and then add these two entries to the /etc/hosts file:
``149.20.54.250 post.audioscrobbler.com``
``149.20.54.250 ws.audioscrobbler.com``



