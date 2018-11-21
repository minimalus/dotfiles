#! /bin/bash
#set -o errexit # exit on first non-true return value
DIR="$(dirname "$0")"
source $DIR/bash/utils.bash

## different installation routines
installBasic() {
  echo "### Installing fonts ###"
  ./bash/install_fonts.bash $@
  printf "${GREEN}done${NORMAL}\n"
  
  echo "### Installing basic debian packages ###"
  ./bash/install_basic.bash $@
  printf "${GREEN}done${NORMAL}\n"
  
  echo "### Installing antibody ###"
  ./bash/install_antibody.bash $@
  printf "${GREEN}done${NORMAL}\n"
  
  echo "### Installing fzf ###"
  ./bash/install_fzf.bash $@
  printf "${GREEN}done${NORMAL}\n"
  
  echo "### Installing neovim ###"
  ./bash/install_nvim.bash $@
  printf "${GREEN}done${NORMAL}\n"
  
  echo "### Installing zsh ###"
  ./bash/install_zsh.bash $@
  printf "${GREEN}done${NORMAL}\n"
}

installFull() {
  echo "### Installing pyenv ###"
  ./bash/install_py_env.bash $@
  printf "${GREEN}done${NORMAL}\n"
  
  echo "### Installing tmux ###"
  ./bash/install_tmux.bash $@
  printf "${GREEN}done${NORMAL}\n"
  
  installBasic $@
}

installExtra() {
  echo "### Installing termitex ###"
  ./bash/install_termite.bash $@
  printf "${GREEN}done${NORMAL}\n"
  
  echo "### Installing ipython/jupyter ###"
  ./bash/install_ipython_jupyter.bash $@
  printf "${GREEN}done${NORMAL}\n"
  
  echo "### Installing extra ###"
  ./bash/install_extra.zsh $@
  printf "${GREEN}done${NORMAL}\n"
  
  installFull $@
}


## actual script
usage="$(basename "$0") [-h|--help] [-v|--verbose] -- script to install zsh tmux neovim and to create links to their configs in this repo

where:
    -h  show this help text
    -v  increase verbosity\n"

PARAMS=$@

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
printf "Three options are given: Basic Full Extra\n"
getUserInputYN "Basic Installation (fonts basic antibody fzf zsh neovim) [yn]?"
if [ $? -eq 0 ] ; then
  installBasic $PARAMS
  # Done
  printf "${GREEN}DOTFILES installed sucessfully${NORMAL}\n"
  exit 0
fi

getUserInputYN "Full Installation (Basic +pyenv tmux) [yn]?"
if [ $? -eq 0 ] ; then
  installFull $PARAMS
  # Done
  printf "${GREEN}DOTFILES installed sucessfully${NORMAL}\n"
  exit 0
fi
getUserInputYN "Extra Installation (Full +termite ipython/jupyter extra) [yn]?"
if [ $? -eq 0 ] ; then
  installExtra $PARAMS
  # Done
  printf "${GREEN}DOTFILES installed sucessfully${NORMAL}\n"
  exit 0
fi
