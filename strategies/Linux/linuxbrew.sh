#!/usr/bin/env bash

STRATEGY_VERSION="v001"

function install {
    sudo apt-get update -y
    sudo apt-get install -y build-essential curl file git
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

    echo '' >> ~/.bash_profile
    echo '################ Linuxbrew #################' >> ~/.bash_profile
    echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >> ~/.bash_profile
    echo 'export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"' >> ~/.bash_profile
    echo 'export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"' >> ~/.bash_profile
    echo 'export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"' >> .bash_profile
}

function uninstall {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/uninstall.sh)"
}

function update {
    brew update
}
