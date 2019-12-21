#!/usr/bin/env bash

STRATEGY_VERSION="v001"


function install {
    brew update
    brew install go
}


function uninstall {
    brwe uninstall go
}


function update {
    brew upgrade go
}

function main {
    install
}
