#!/bin/sh -ex

cd `mktemp -d /tmp/rxvt.XXXXXX`

apt-get source rxvt-unicode-ml

sudo apt-get build-dep rxvt-unicode-ml

cd rxvt-unicode-*/

perl -pi -e 's/--enable-iso14755/--disable-iso14755/g' debian/rules

fakeroot debian/rules binary

sudo dpkg -i ../rxvt-unicode-ml*deb

