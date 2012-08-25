#!/bin/sh -ex

cd `mktemp -d /tmp/rxvt.XXXXXX`

apt-get source rxvt-unicode-ml

sudo apt-get build-dep rxvt-unicode-ml

cd rxvt-unicode-*/

perl -pi -e 's/--enable-iso14755/--disable-iso14755/g' debian/rules

patch -p1 < doc/urxvt-8.2-256color.patch

fakeroot debian/rules binary

sudo dpkg -i ../rxvt-unicode-ml*deb

