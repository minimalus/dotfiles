#! /bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash
##############################
## install zsh zsh-antigen  ##
##############################
PKGS="zsh zsh-antigen fonts-powerline"
installDebIf $PKGS

# set zsh as default shell
sudo chsh --shell /usr/bin/zsh

# zsh
printf "Setting up zsh\n"
echo $DOTFILES/zsh/zshrc
lnif $DOTFILES/zsh/zshrc $HOME/.zshrc

# run zsh to install packages
exec "$SHELL"
