#! /bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash
##############################
## install zsh zsh-antigen  ##
##############################
PKGS="zsh"
installDebIf $PKGS

# set zsh as default shell
echo "Need sudo pwd for chsh"
chsh --shell /usr/bin/zsh

# link zsh.rc
lnif $DOTFILES/zsh/zshrc $HOME/.zshrc

# run zsh to install packages
zsh $HOME/.zshrc
