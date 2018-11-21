#! /bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash
redirectStdoutStderrIfNotVerbose $@
###############################
## install misc deb packages ##
###############################
sudo add-apt-repository universe > /dev/null # make sure universe is enabled
PKGS='vifm youtube-viewer ncmpcpp'
installDebIf $PKGS
