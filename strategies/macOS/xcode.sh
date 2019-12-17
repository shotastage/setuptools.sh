#!/usr/bin/env bash

STRATEGY_VERSION="v001"
CURRENT_ID="497799835"


function install {
    brew update
    brew install mas
    mas install $CURRENT_ID
}

function uninstall {
    echo "🛑  Xcode is necessary for setuptools.sh & other development software!"
    echo "🛑  This operation probably cause critical changes."
    echo "🛑  For stability reason, abort and cancel this operation defualt."
}

function update {
    mas upgrade $CURRENT_ID
}
