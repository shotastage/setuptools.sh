#!/usr/bin/env bash

STRATEGY_VERSION="v001"
CURRENT_ID="1037126344"


install() {
    brew update
    brew install mas
    mas install $CURRENT_ID
}

uninstall() {
    sudo mas uninstall $CURRENT_ID
}

update() {
    mas upgrade $CURRENT_ID
}

main() {
    install
}
