#!/bin/bash

set -e

MIN_NEOVIM_VERSION="0.8.0"

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

info () {
  printf "${BBlue}[spacevim-setup]${Color_Off} ${Green}$1${Color_Off}\n"
}

error () {
    printf "${BRed}[spacevim-setup ERROR]${Color_Off} $1. Aborting...\n"
    exit 1
}

question () {
    printf "${BBlue}[spacevim-setup]${Color_Off} $1\n"
}

yesno () {
    printf "${BBlue}[spacevim-setup]${Color_Off} $1 [Y/n] ?\n"
    read answer

    if [[ "$answer" != "Y" ]] | [[ "$answer" != "y" ]]
    then
        printf "${BRed}[spacevim-setup]${Color_Off} Aborting...\n"
        exit 0
    fi
}

# === usefull function === #

function version { echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'; }

check_neovim_version () {
    local NEOVIM_VERSION=$($1 --version | grep 'NVIM')
    NEOVIM_VERSION=${NEOVIM_VERSION:6}
    echo $NEOVIM_VERSION
}

install_neovim_appimage () {
    info "Fetching latest neovim appimage"
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    info "Moving appimage to /usr/bin (sudo might be required)"
    sudo mv nvim.appimage /usr/bin
    info "Appimage installed. You might consider adding an alias to your .bashrc: alias nvim='nvim.appimage'"
}

# === Uninstalling SpaceVim === #

curl -sLf https://spacevim.org/install.sh | bash -s -- --uninstall

# === Checking Neovim version === #

question "Please insert the neovim binary's path (use which nvim or check your bashrc if you use aliases. If you don't have neovim installed press enter."
read NEOVIM_EXEC_PATH

if [[ ${NEOVIM_EXEC_PATH} ]]
then
    if [ ! -f "$NEOVIM_EXEC_PATH" ]
    then
        error "Path not found: '${NEOVIM_EXEC_PATH}'"
    else
        NEOVIM_VERSION=$(check_neovim_version $NEOVIM_EXEC_PATH)
        
        if [ $(version "$MIN_NEOVIM_VERSION") -ge $(version "$NEOVIM_VERSION") ]
        then
            info "Neovim is not up to date ($NEOVIM_VERSION < $MIN_NEOVIM_VERSION)"
            yesno "Install newest neovim appimage"
            install_neovim_appimage
        else
            info "Neovim is up to date !"
        fi
    fi
else
    yesno "Install newest neovim appimage"
    install_neovim_appimage
fi

echo $NEOVIM_EXEC_PATH

# === SpaceVim set up === #

info "Fetching spacevim installer"
curl -sLf https://spacevim.org/install.sh | bash

if [ -f "$NEOVIM_EXEC_PATH" ]
then
    $NEOVIM_EXEC_PATH
fi