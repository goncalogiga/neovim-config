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

# === Neovim Setup === #




function version { 
    echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'; 
}




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




setup_neovim () {
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
}




load_config () {
    info "Downloading neovim configuration files..."
    tmp_dir="/tmp/$(tr -dc A-Za-z0-9 </dev/urandom | head -c 8 ; echo '')/"
    mkdir $tmp_dir
    git clone https://github.com/goncalogiga/neovim-config $tmp_dir
    info "Backing up previous configuration under $HOME/.config/nvim/.backup/."
    mkdir -p $HOME/.config/nvim/.backup
    rm -rf $HOME/.config/nvim/.backup/* # cleaning previous backup
    touch $HOME/.config/nvim/backed_up_the_$(date '+%Y-%m-%d')
    mv $HOME/.config/nvim/* $HOME/.config/nvim/.backup
    info "Loading remote config locally..."
    mv $tmp_dir/config/* $HOME/.config/nvim
    info "Successfully loaded the lua configuration files."
}




test_node_version () {
    info "Health check on nodejs (neccesary for some plugins)"
    node --version
    local NODEJS_VERSION=$(node --version)
    NODEJS_VERSION=${NODEJS_VERSION:1}

    if [ $(version "$MIN_NODEJS_VERSION") -ge $(version "$NODEJS_VERSION") ]
    then
        warning "Nodejs is out of date in order for some vim plugins to work proprely !"
        warning "To update nodejs use nvm, install it if it is not installed already:"
        warning "https://github.com/nvm-sh/nvm#install--update-script"
        warning "To install using nvm, run the following in a terminal:"
        warning "> npm install 16.19.1"
        warning "Also install neovim just to be sure:"
        warning "> npm install -g neovim"
        warning "Some plugins also need yarn:"
        warning "> npm install --global yarn"
    else
        info "Nodejs is up to date !"
    fi
}




test_pip_vim() {
    info "Make sure neovim and pynvim are installed:"
    pip3 list | grep "vim"
    info "Make sure a linter is installed :"
    pip3 list | grep "lint"
}



final_advice() {
    info "Don't forget to run :PackerInstall and :checkhealth once you start neovim !"

}



# === main ===

setup_neovim
load_config
test_node_version
test_pip_vim
final_advice
info "All done!"
