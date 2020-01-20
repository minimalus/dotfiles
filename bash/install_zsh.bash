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

## copy completions
mkdir -p ~/.zsh/completions

# bazel completion
git clone https://github.com/jackwish/bazel /tmp/bazel_plugin
cp /tmp/bazel_plugin/_bazel ~/.zsh/completions/
rm -rf /tmp/bazel_plugin

