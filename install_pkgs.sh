#! /bin/bash

installDebIf() {
for pkg in $@; do
  if ! isInstalledDeb $pkg; then
    sudo apt-get install -y $pkg
  fi
done
return 0
}

isInstalledDeb() {
dpkg-query -W $1 > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo $1 already installed: `dpkg-query -W $1`
  return 0
fi
return 1
}

installPipIf() {
for pkg in $@; do
  if ! isInstalledPip $pkg; then
    sudo pip3 install $pkg
  fi
done
return 0
}

isInstalledPip() {
pip show $1 > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo $1 already installed: `pip3 show $1 | grep ^Version`
  return 0
fi
return 1
}

## needed to get all powerline fonts and terminus
installFonts() {
  mkdir -p /tmp/fonts
  # install fonts ## https://github.com/powerline/fonts
  git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
  # install
  /tmp/fonts/install.sh
  # enable terminus
  mkdir -p ~/.config/fontconfig/conf.d
  cp /tmp/fonts/fontconfig/*.conf ~/.config/fontconfig/conf.d
  fc-cache -vf
  # clean-up a bit
  rm -rf /tmp/fonts
}

##################
## install nvim ##
##################
if ! isInstalledDeb neovim; then
  sudo apt-get install -y software-properties-common
  sudo add-apt-repository ppa:neovim-ppa/stable -y
  sudo apt-get update
  installDebIf neovim clang # get python support for neovim
  installPipIf neovim 
fi

## install vim-plug ##
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo vim-plug already installed
fi

###################################
## install zsh zsh-antigen tmux  ##
###################################
PKGS="zsh zsh-antigen fonts-powerline tmux"
installDebIf $PKGS

###############################
## install misc deb packages ##
###############################
PKGS='terminator tree gitg silversearcher-ag synaptic python-dev python3-dev python3-pip thefuck tig htop cmake build-essential'
installDebIf $PKGS

###############################
## install misc pip packages ##
###############################
PKGS=''
installPipIf $PKGS
