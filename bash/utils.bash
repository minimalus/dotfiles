#! /bin/bash
# desired python versions
PY2_VER=2.7.11
PY2_NAME='py2'
PY3_VER=3.4.4
PY3_NAME='py3'

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
    pip install --user $pkg
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

NORMAL=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)

SCRIPT=$(readlink -f $0)
DOTFILES="$(dirname $SCRIPT)/.."

lnif() {
  # does requested config exist
  if [ ! -e $1 ] ; then
    printf "${RED}Failed; (Config $1 not found)${NORMAL}\n"; return
  fi

  # does the correct link already exist
  if [[ -e $2 && -L $2 && "$(readlink -f $2)" == "$1" ]] ; then  # config exists, it is a link and is equal to requested link
      printf "${GREEN}Link exists already${NORMAL}\n"; return
  fi

  # need to check if we need to create a backup
  if [ -e $2  ] ; then
    echo Config file exists
    echo Config file: $2
    if [ ! -L $2 ] ; then # it is not a link, create backup
      cp $2 $2_backup
      printf "${RED}Old config $2 backuped to $2_backup${NORMAL}\n"
    fi
  fi
  # now we remove the old config or link
  rm -f $2
  # old config removed or no previous config found
  ln -s $1 $2
  printf "${GREEN}Done${NORMAL}\n"
}
