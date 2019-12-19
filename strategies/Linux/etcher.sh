#!/usr/bin/env bash

STRATEGY_VERSION="v001"


function install {
    echo "🖊  Adding APT repositories..."
    echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
    echo "⬇️  Installing key..."
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
    echo "🔑  sudo Password is required!"
    echo "🔄 Updating APT index..."
    sudo apt-get -qq -y update
    echo "⬇️ Installing balenaEtcher..."
    sudo apt-get -qq -y install balena-etcher-electron
    echo "🐤  Installation completed!"
}

function uninstall {
    sudo apt-get remove balena-etcher-electron
    sudo rm /etc/apt/sources.list.d/balena-etcher.list
    sudo apt-get update
}

function update {
    sudo apt-get install balena-etcher-electron -y
}

function main {
    install
}
