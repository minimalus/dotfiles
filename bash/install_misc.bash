#! /bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash
###############################
## install misc deb packages ##
###############################
PKGS='terminator tree gitg silversearcher-ag synaptic python-dev python3-dev python3-pip thefuck tig htop cmake build-essential vifm'
installDebIf $PKGS

###############################
## install misc pip packages ##
###############################
PKGS=''
installPipIf $PKGS

## change default terminal-emulator
sudo update-alternatives --config x-terminal-emulator

