#!/usr/bin/env bash

STRATEGY_VERSION="v001"


function install {
    echo "🔄  Updating Homebrew ..."
    brew update

    echo "🔄  Installing Hyper via Homebrew ..."
    brew cask install hyper
}

function uninstall {
    brew uninstall hyper
}

function update {
    echo "A"
}

function main {
    install
}
