#!/bin/bash
NORMAL=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)

dotfiles=`pwd`

lnif() {
  # does requested config exist
  if [ ! -e $1 ] ; then
    printf "${RED}Failed; (Config $1 not found)${NORMAL}\n"; return;
  fi
  # old config exists already
  if [ -e $2 ] ; then
    # config is a symbolic link
    if [[  -L $2 && "$(readlink -f $1)" && "$1" ]] ; then
      printf "${GREEN}Link exists already${NORMAL}\n"
      return
    fi
    # else ask if we should remove old file or link
    while true; do
      read -p "File $2 exists, do you wish to replace it? [y/n]" yn
      case $yn in
        [Yy]* ) rm $2;  break;;
        [Nn]* ) printf "${RED}Skipped${NORMAL}\n";return;;
        * ) echo "Please answer yes or no.";;
      esac
    done
  fi
  # no previous config found
  ln -s $1 $2
  printf "${GREEN}Done${NORMAL}\n"
}


# vim
printf "Setting up neovim\n"
lnif $dotfiles/neovim/init.vim $HOME/.config/nvim/init.vim
printf "Setting up zsh\n"
lnif $dotfiles/zsh/zshrc $HOME/.zshrc
printf "Setting up tmux\n"
lnif $dotfiles/tmux/tmux.conf $HOME/.tmux.config
 
