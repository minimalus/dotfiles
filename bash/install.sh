#! /bin/bash
set -o errexit # exit on first non-true return value
DIR="$(dirname "$0")"
source $DIR/bash/utils.bash
# check if script gets executed in dotfiles directory
if [[ ! -f zsh/zshrc || ! -f tmux/tmux.conf || ! -f neovim/init.vim ]] ; then
  echo "Could not find all required configs. Maybe you did not call install.sh from the dotfile directory?"
  exit 1
fi

# install eveything
#result=$(getUserInputYN "Install everything (zsh neovim pyenv tmux misc) [yn]?")
getUserInputYN "Install everything (zsh neovim pyenv tmux misc) [yn]?"
if [ $? -eq 0 ] ; then
  echo "### Installing pyenv ###"
  ./bash/install_py_env.bash
  echo "### Installing neovim ###"
  ./bash/install_nvim.bash
  echo "### Installing tmux ###"
  ./bash/install_tmux.bash
  echo "### Installing misc ###"
  ./bash/install_misc.bash
  echo "### Installing zsh ###"
  ./bash/install_zsh.bash
else
  # install pyenv
  getUserInputYN "create Python virtual environments [yn]?"
  if [ $? -eq 0 ] ; then
    ./bash/install_py_env.bash
  fi
  # install neovim
  getUserInputYN "install neovim [yn]?"
  if [ $? -eq 0 ] ; then
    ./bash/install_nvim.bash
  fi
  # install tmux
  getUserInputYN "install tmux [yn]?"
  if [ $? -eq 0 ] ; then
    ./bash/install_tmux.bash
  fi
  # install misc
  getUserInputYN "install misc packages [yn]?"
  if [ $? -eq 0 ] ; then
    ./bash/install_misc.bash
  fi
  # install zsh and starts it to install antigen packages
  getUserInputYN "install zsh [yn]?"
  if [ $? -eq 0 ] ; then
    ./bash/install_zsh.bash
  fi
fi
# Done
printf "${GREEN}DOTFILES installed sucessfully${NORMAL}\n"
