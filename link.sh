#! /bin/bash
NORMAL=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)

dotfiles=`pwd`

lnif() {
  # does requested config exist
  if [ ! -e $1 ] ; then
    printf "${RED}Failed; (Config $1 not found)${NORMAL}\n"; return
  fi
  
  # does the correct link already exist
  if [[ -e $2 && -L $2 && "$(readlink -f $2)" == "$1" ]] ; then  # config exists, it is a link and is equal to requested link
      printf "${GREEN}Link exists already${NORMAL}\n"; return
  fi

  # need to check if we need to create a backup
  if [ -e $2  ] ; then
    echo Config file exists
    echo Config file: $2
    if [ ! -L $2 ] ; then # it is not a link, create backup
      cp $2 $2_backup
      printf "${RED}Old config $2 backuped to $2_backup${NORMAL}\n"
    fi
  fi
  # now we remove the old config or link
  rm -f $2
  # old config removed or no previous config found
  ln -s $1 $2
  printf "${GREEN}Done${NORMAL}\n"
}

## create symbolic links
# vim
printf "Setting up neovim\n"
mkdir -p $HOME/.config/nvim/
lnif $dotfiles/neovim/init.vim $HOME/.config/nvim/init.vim
# zsh
printf "Setting up zsh\n"
lnif $dotfiles/zsh/zshrc $HOME/.zshrc
# tmux
printf "Setting up tmux\n"
lnif $dotfiles/tmux/tmux.conf $HOME/.tmux.conf
 
