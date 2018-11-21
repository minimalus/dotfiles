#! /bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash
if isVerboseSet $@; then
  VERBOSE=1
fi

##################
## install nvim ##
##################
if ! isInstalledDeb neovim; then
  sudo add-apt-repository universe > /dev/null # make sure universe is enabled
  sudo apt-get install -y software-properties-common
  sudo add-apt-repository ppa:neovim-ppa/stable -y
  sudo apt-get update
  installDebIf neovim clang python-dev python-pip python3-dev python3-pip # get python support for neovim

  if [ -f $HOME/.pyenv/bin/pyenv ]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  # install neovim python binding for py2 and py3 if pyenv is setup
    if [ -z "$(pyenv versions | grep $PY2_NAME)" ]; then
      pyenv activate py2
      installPipIf neovim
      pyenv deactivate 2>/dev/null
    fi
    if [ -z "$(pyenv versions | grep $PY3_NAME)" ]; then
      pyenv activate py3
      installPipIf neovim
      pyenv deactivate 2>/dev/null
    fi
  fi
  # for system python
  installPipIf neovim
fi
## install vim-plug ##
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
elif [ -n "$VERBOSE" ]; then
  printf "vim-plug already installed"
fi

# create link to init.vim
mkdir -p $HOME/.config/nvim/
lnif $DOTFILES/neovim/init.vim $HOME/.config/nvim/init.vim

## set neo vim to be the default editor
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim 
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

## install vim plugins
# create tmp file with short info
touch /tmp/vim_install_note
echo "Running PlugInstall, vim will close when finished" > /tmp/vim_install_note
# start vim, show note and install plugins
vim /tmp/vim_install_note +PlugInstall +qa 
# delete file
rm /tmp/vim_install_note
