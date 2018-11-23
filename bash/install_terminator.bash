#! /bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash
redirectStdoutStderrIfNotVerbose $@
###############################
## install basic deb packages ##
###############################
PKGS='terminator'
installDebIf $PKGS

# create link to termite config
mkdir -p $HOME/.config/terminator/
lnif $DOTFILES/terminator/config $HOME/.config/terminator/config

# change terminal emulator
restoreStdoutStderr
sudo update-alternatives --config x-terminal-emulator
