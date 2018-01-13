#! /bin/bash
set -e #exit on error
DIR="$(dirname "$0")"
source $DIR/utils.bash
#####################
## install termite ##
#####################
#from https://github.com/Corwind/termite-install/blob/master/termite-install.sh
git clone --recursive https://github.com/thestinger/termite.git /tmp/termite
git clone https://github.com/thestinger/vte-ng.git /tmp/vte-ng

PKGS='g++ libgtk-3-dev gtk-doc-tools gnutls-bin valac intltool libpcre2-dev libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev libxml2-utils gperf'
installDebIf $PKGS

echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
PWD=`pwd`
cd /tmp/vte-ng && ./autogen.sh && make && sudo make install
cd ../termite && make && sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x
#sudo ln -s \
#/usr/local/share/terminfo/x/xterm-termite \
#/lib/terminfo/x/xterm-termite
lnif /usr/local/share/terminfo/x/xterm-termite /lib/terminfo/x/xterm-termite

# create link to termite config
mkdir -p $HOME/.config/termite/
lnif $DOTFILES/termite/config $HOME/.config/termite/config

# clean up
rm -rf /tmp/termite /tmp/vte-ng
cd $PWD
