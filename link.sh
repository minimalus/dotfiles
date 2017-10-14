#!/bin/sh
NORMAL=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)

dotfiles=`pwd`

lnif() {
  if [ ! -e $1 ] ; then
    printf "${RED}Failed; (Config $1 not found)${NORMAL}\n"; return;
  fi
  if [ -e $2 ] ; then
    while true; do
      read -p "File $2 exists, do you wish to replace it?" yn
      case $yn in
        [Yy]* ) rm $2;  break;;
        [Nn]* ) printf "${RED}Skipped\n";return;;
        * ) echo "Please answer yes or no.";;
      esac
    done
  fi
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
 
