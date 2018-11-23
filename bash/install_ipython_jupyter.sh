#! /bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash
redirectStdoutStderrIfNotVerbose $@
#############################
## install ipython jupyter ##
#############################
## from https://github.com/lambdalisue/jupyter-vim-binding/wiki/Installation
pip install jupyter_contrib_nbextensions --user
jupyter contrib nbextension install --user
pip install jupyter_nbextensions_configurator --user
jupyter nbextensions_configurator enable --user

# You may need the following to create the directoy
mkdir -p $(jupyter --data-dir)/nbextensions
# Now clone the repository
cd $(jupyter --data-dir)/nbextensions
rm -rf $(jupyter --data-dir)/nbextensions/vim_binding
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
chmod -R go-w vim_binding

firefox http://localhost:8888/nbextensions/


# for python3
pip3 install jupyter_contrib_nbextensions --user
jupyter contrib nbextension install --user
pip3 install jupyter_nbextensions_configurator --user
jupyter nbextensions_configurator enable --user
