#! /bin/bash

# check if script gets executed in dotfiles directory
if [[ ! -f zsh/zshrc || ! -f tmux/tmux.conf || ! -f neovim/init.vim ]] ; then
  echo "Could not find all required configs. Maybe you did not call install.sh from the dotfile directory?"
  exit 1
fi

# install req. packages
sudo ./install_pkgs.sh

# create links to configs
sudo ./link.sh

# set default terminal, editor and install zsh and vim plugins
sudo ./post_install.sh
