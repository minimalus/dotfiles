#!/bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash
redirectStdoutStderrIfNotVerbose $@
##################
## install fzf  ##
##################
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all  # enable completions for all shells
