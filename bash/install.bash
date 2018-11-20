#! /bin/bash
#set -o errexit # exit on first non-true return value
DIR="$(dirname "$0")"
source $DIR/bash/utils.bash

usage="$(basename "$0") [-h|--help] [-v|--verbose] -- script to install zsh tmux neovim and to create links to their configs in this repo

where:
    -h  show this help text
    -v  increase verbosity\n"

# get arguments
while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    -v|--verbose)
    export VERBOSE=1
    shift
    ;;
    -h|--help)
    printf "$usage"
    exit 0
    ;;
    *)    # unknown option
    echo "Unknown Option $2"
    exit 1
    ;;
esac
done

# check if script gets executed in dotfiles directory
if [[ ! -f zsh/zshrc || ! -f tmux/tmux.conf || ! -f neovim/init.vim || ! -f termite/config ]] ; then
  echo "Could not find all required configs. Maybe you did not call install.sh from the dotfile directory?"
  exit 1
fi

# install eveything
#result=$(getUserInputYN "Install everything (zsh neovim pyenv tmux misc) [yn]?")
getUserInputYN "Basic Installation (fonts basic antibody fzf zsh neovim) [yn]?"
if [ $? -eq 0 ] ; then
  echo "### Installing fonts ###"
  ./bash/install_fonts.bash
  echo "### Installing basic debian packages ###"
  ./bash/install_basic.bash
  echo "### Installing antibody ###"
  ./bash/install_antibody.bash
  echo "### Installing fzf ###"
  ./bash/install_fzf.bash
  echo "### Installing neovim ###"
  ./bash/install_nvim.bash
  echo "### Installing zsh ###"
  ./bash/install_zsh.bash
  # Done
  printf "${GREEN}DOTFILES installed sucessfully${NORMAL}\n"
  exit 0
fi
getUserInputYN "Full Installation (Basic +pyenv tmux) [yn]?"
if [ $? -eq 0 ] ; then
  echo "### Installing fonts ###"
  ./bash/install_fonts.bash
  echo "### Installing basic debian packages ###"
  ./bash/install_basic.bash
  echo "### Installing antibody ###"
  ./bash/install_antibody.bash
  echo "### Installing fzf ###"
  ./bash/install_fzf.bash
  echo "### Installing pyenv ###"
  ./bash/install_py_env.bash
  echo "### Installing tmux ###"
  ./bash/install_tmux.bash
  echo "### Installing neovim ###"
  ./bash/install_nvim.bash
  echo "### Installing zsh ###"
  ./bash/install_zsh.bash
  # Done
  printf "${GREEN}DOTFILES installed sucessfully${NORMAL}\n"
  exit 0
fi
getUserInputYN "Experimental Installation (Full +termite ipython/jupyter extra) [yn]?"
if [ $? -eq 0 ] ; then
  echo "### Installing fonts ###"
  ./bash/install_fonts.bash
  echo "### Installing basic debian packages ###"
  ./bash/install_basic.bash
  echo "### Installing antibody ###"
  ./bash/install_antibody.bash
  echo "### Installing fzf ###"
  ./bash/install_fzf.bash
  echo "### Installing pyenv ###"
  ./bash/install_py_env.bash
  echo "### Installing tmux ###"
  ./bash/install_tmux.bash
  echo "### Installing termitex ###"
  ./bash/install_termite.bash
  echo "### Installing ipython/jupyter ###"
  ./bash/install_ipython_jupyter.bash
  echo "### Installing neovim ###"
  ./bash/install_nvim.bash
  echo "### Installing extra ###"
  ./bash/install_extra.zsh
  echo "### Installing zsh ###"
  ./bash/install_zsh.bash
  # Done
  printf "${GREEN}DOTFILES installed sucessfully${NORMAL}\n"
  exit 0
fi
