#! /bin/bash

# check if script gets executed in dotfiles directory
if [[ ! -f zsh/zshrc || ! -f tmux/tmux.conf || ! -f neovim/init.vim ]] ; then
  echo "Could not find all required configs. Maybe you did not call install.sh from the dotfile directory?"
  exit 1
fi

# install zsh
./bash/install_zsh.bash 

# install pyenv
./bash/install_py_env.bash 

# install neovim
./bash/install_nvim.bash 

# install tmux
./bash/install_tmux.bash 

# install misc
./bash/install_misc.bash 

