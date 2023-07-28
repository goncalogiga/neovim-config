#!/bin/bash

set -e

MIN_NEOVIM_VERSION="0.8.0"
MIN_NODEJS_VERSION="16.19.0"

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
    printf "${BBlue}[neovim-config]${Color_Off} ${Green}$1${Color_Off}\n"
}

warning () {
    printf "${BBlue}[neovim-config WARNING]${Color_Off} ${BYellow}$1${Color_Off}\n"
}

error () {
    printf "${BRed}[neovim-config ERROR]${Color_Off} $1. Aborting...\n"
    exit 1
}

question () {
    printf "${BBlue}[neovim-config]${Color_Off} $1\n"
}

yesno () {
    printf "${BBlue}[neovim-config]${Color_Off} $1 [Y/n] ?\n"
    read answer

    if [[ "$answer" != "Y" ]] && [[ "$answer" != "y" ]]
    then
        printf "${BRed}[neovim-config]${Color_Off} Aborting...\n"
        exit 0
    fi
}


rm -rf config/*
cp -r $HOME/.config/nvim/* config/
info "Successfully updated the repository configuration with your local configuration !"
