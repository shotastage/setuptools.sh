#!/usr/bin/env bash

STRATEGY_VERSION="v001"

install() {
    brew update
    brew install pyenv
    pyenv install 3.8.0
    brew install pipenv
}

function uninstall {
    pyenv uninstall 3.8.0
    brew uninstall pyenv
    brew uninstall pipenv
}

function update {
    echo "THIS IS UPDATE SECTION..."
}

function main {
    install
}
