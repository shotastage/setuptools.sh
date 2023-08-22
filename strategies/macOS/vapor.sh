#!/usr/bin/env bash

STRATEGY_VERSION="v001"

function install {
    brew install vapor
}

function uninstall {
    brew uninstall vapor
}

function update {
    brew update
    brew upgrade vapor
}

function main {
    install
}
