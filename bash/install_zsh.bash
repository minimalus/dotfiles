#! /bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash
if isVerboseSet $@; then
  VERBOSE=1
fi
##############################
## install zsh zsh-antigen  ##
##############################
PKGS="zsh"
installDebIf $PKGS

# set zsh as default shell
printf "Need sudo pwd for chsh\n"
chsh --shell /usr/bin/zsh

# link zsh.rc
lnif $DOTFILES/zsh/zshrc $HOME/.zshrc

# run zsh to install packages
zsh $HOME/.zshrc
