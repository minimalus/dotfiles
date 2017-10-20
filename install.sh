#! /bin/bash

# install req. packages
sudo ./install_pkgs.sh

# create links to configs
sudo ./link.sh

# set default terminal, editor and install zsh and vim plugins
sudo ./post_install.sh
