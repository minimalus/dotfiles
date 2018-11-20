#! /bin/bash
DIR="$(dirname "$0")"
source $DIR/utils.bash
## needed to get all powerline fonts and terminus
# if -v verbose is set, set stdout and stderr to dev null
if [ -n "$VERBOSE" ]; then
  exec 3>&1 4>&2 1>/dev/null 2>&1
  #exec >/dev/null 2>&1
fi
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

# set stdout and stderr to old values
if [ -n "$VERBOSE" ]; then
  exec 1>&3 2>&4
fi
#exec >/dev/null 2>&1
printf "${GREEN}done${NORMAL}\n"
