##################
## install nvim ##
##################
if dpkg-query -W neovim; then
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim
sudo pip3 install neovim # get python support for neovim
sudo apt-get install -y clang # for autocompeltion of C++

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
fi

## install vim-plug ##
if [ ! -f "~/.local/share/nvim/site/autoload/plug.vim" ]; then
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

#################
## install zsh ##
#################
sudo apt-get install -y zsh
sudo pip3 install thefuck


## install antigen
sudo apt-get install -y zsh-antigen

##################
## install tmux ##
##################
sudo apt-get install -y tmux
