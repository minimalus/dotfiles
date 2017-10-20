#! /bin/bash

## change default terminal-emulator                                                                                                                                                      
sudo update-alternatives --config x-terminal-emulator

# set zsh as default shell                                                                                                                                                              
sudo chsh --shell /usr/bin/zsh
# run zsh to install packages
reset -Q 

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

