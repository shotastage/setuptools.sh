#!/usr/bin/env bash

STRATEGY_VERSION="v001"

function install {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function uninstall {
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
}

function update {
    brew update
}
