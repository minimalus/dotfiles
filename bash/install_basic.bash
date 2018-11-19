#! /bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash
###############################
## install basic deb packages ##
###############################
sudo add-apt-repository universe > /dev/null # make sure universe is enabled
PKGS='git tig tree curl silversearcher-ag synaptic thefuck htop cmake build-essential'
installDebIf $PKGS
