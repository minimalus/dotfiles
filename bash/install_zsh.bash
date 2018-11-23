#! /bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash
redirectStdoutStderrIfNotVerbose $@
##############################
## install zsh zsh-antigen  ##
##############################
PKGS="zsh"
installDebIf $PKGS

# link zsh.rc
lnif $DOTFILES/zsh/zshrc $HOME/.zshrc

# set zsh as default shell
restoreStdoutStderr
printf "Need sudo pwd for chsh\n"
chsh --shell /usr/bin/zsh

# run zsh to install packages
zsh $HOME/.zshrc
