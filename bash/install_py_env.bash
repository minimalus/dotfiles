#! /bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash
################
## setup pyenv ##
#################
# requirements from https://github.com/pyenv/pyenv/wiki/Common-build-problems
installDebIf make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev

if [ ! -x "$(command -v pyenv)" ]; then
    curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
fi

export PATH="/home/daniel/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
if [ -z "$(pyenv versions | grep $PY2_NAME)" ]; then
    pyenv install $PY2_VER
    pyenv virtualenv $PY2_VER $PY2_NAME
else
    echo pyenv for $PY2_NAME already installed
fi
if [ -z "$(pyenv versions | grep $PY3_NAME)" ]; then
    pyenv install $PY3_VER
    pyenv virtualenv $PY3_VER $PY3_NAME
else
    echo pyenv for $PY3_NAME already installed
fi
# for now switch to system pyenv
pyenv deactivate 2>/dev/null
