#!/bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash

# download most recent version and install
curl -sL https://git.io/antibody | sh -s
# for static loading, see https://getantibody.github.io/ for more details
# link zsh_plugins.txt
lnif $DOTFILES/antibody/zsh_plugins.txt $HOME/.zsh_plugins.txt
antibody bundle <"$HOME/.zsh_plugins.txt" >~/.zsh_plugins.sh
antibody update
