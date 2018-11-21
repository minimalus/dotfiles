#! /bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash
redirectStdoutStderrIfNotVerbose $@
###################
## install tmux  ##
###################
PKGS="tmux"
installDebIf $PKGS

## create symbolic link for tmux config
printf "Setting up tmux\n"
lnif $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf
