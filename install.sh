isInstalledDeb() {
dpkg-query -W $1 > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo $1 already installed: `dpkg-query -W $1`
  return 0
fi
return 1
}

isInstalledPy() {
pip show $1 > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo $1 already installed: `pip show $1 | grep ^Version`
  return 0
fi
return 1
}

mapCapsToCtrl() {
  if ! grep -q ctrl:nocaps ~/.zshrc; then
    sed -i -e "\$a ## map caps to ctrl\nsetxkbmap -layout us -option ctrl:nocaps" ~/.zshrc
  fi
  if ! grep -q ctrl:nocaps ~/.bashrc; then
    sed -i -e "\$a ## map caps to ctrl\nsetxkbmap -layout us -option ctrl:nocaps" ~/.bashrc
  fi
}

## needed to get all powerline fonts and terminus
installFonts() {
  # install fonts ## https://github.com/powerline/fonts
  git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
  # install
  /tmp/fonts/install.sh
  # enable terminus
  # mkdir -p ~/.config/fontconfig/conf.d
  #cp /tmp/fonts/fontconfig/*.conf ~/.config/fontconfig/conf.d
  #fc-cache -vf
  # clean-up a bit
  rm -rf /tmp/fonts
}

##################
## install nvim ##
##################
if ! isInstalledDeb neovim; then
  sudo apt-get install -y software-properties-common
  sudo add-apt-repository ppa:neovim-ppa/stable
  sudo apt-get update
  sudo apt-get install -y neovim
  sudo pip install neovim # get python support for neovim
  sudo apt-get install -y clang # for autocompeltion of C++

  sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
  sudo update-alternatives --config vi
  sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
  sudo update-alternatives --config vim
  sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
  sudo update-alternatives --config editor
fi

# change default terminal-emulator
sudo update-alternatives --config x-terminal-emulator

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
for pkg in $PKGS; do
  if ! isInstalledDeb $pkg; then
    sudo apt-get install -y $pkg
  fi
done

# set zsh as default shell
chsh --shell /usr/bin/zsh

###############################
## install misc deb packages ##
###############################
PKGS='terminator tree gitg silversearcher-ag synaptic python-dev python3-dev python3-pip thefuck tig htop cmake build-essential'
for pkg in $PKGS; do
  if ! isInstalledDeb $pkg; then
    sudo apt-get install -y $pkg
  fi
done


###############################
## install misc pip packages ##
###############################
PKGS=''
for pkg in $PKGS; do
  if ! isInstalledPy $pkg; then
    sudo pip3 install $pkg
  fi
done

###########################
## map caps lock to ctrl ##
###########################
# new to load zsh ones, so we can add this line to the runconfig
zsh
read -p "Do you want to map caps lock to ctrl [y/n] " yn
while true; do
  case $yn in
    [Yy]* ) mapCapsToCtrl;  break;;
    [Nn]* ) printf "Skipped\n";break;;
    * ) echo "Please answer yes or no.";;
  esac
done
