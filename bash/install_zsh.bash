#! /bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash
##############################
## install zsh zsh-antigen  ##
##############################
PKGS="zsh zsh-antigen fonts-powerline"
installDebIf $PKGS

# set zsh as default shell
chsh --shell /usr/bin/zsh

# link zsh.rc
lnif $DOTFILES/zsh/zshrc $HOME/.zshrc

# run zsh to install packages
zsh $HOME/.zshrc
