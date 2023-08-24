#!/usr/bin/env bash

STRATEGY_VERSION="v001"
CURRENT_ID="1487937127"


. ~/.setuptools/lib/foundation.sh
. ~/.setuptools/lib/use_mas.sh


function install {
    use_mass
    mas install $CURRENT_ID
}

function uninstall {
    use_mass
    mas uninstall $CURRENT_ID
}

function update {
    use_mass
    mas upgrade $CURRENT_ID
}

function main {
    install
}
