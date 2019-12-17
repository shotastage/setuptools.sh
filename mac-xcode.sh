#!/usr/bin/env bash

function install {
    brew update
    brew install mas
    mas install 497799835
}

function uninstall {
    echo "THIS IS UNINSTALL SECTION..."
}

function update {
    echo "THIS IS UPDATE SECTION..."
}

function main {
    install
}

main
