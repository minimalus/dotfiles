#! /bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash
redirectStdoutStderrIfNotVerbose $@
###################
## install fonts ##
###################
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
