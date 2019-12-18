#!/usr/bin/env bash

STRATEGY_VERSION="v001"

function install {
    sudo apt-get update -y
    sudo apt-get install -y build-essential curl file git
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
}

function uninstall {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/uninstall.sh)"
}

function update {
    brew update
}
