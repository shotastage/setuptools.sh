#!/usr/bin/env bash
set -e


WORKING_DIRECTORY=~/.setuptools
MASTER_URL="https://raw.githubusercontent.com/shotastage/setuptools.sh/master"


function execute {
    cd $WORKING_DIRECTORY/strategies/
    curl --silent -O "${MASTER_URL}/mac-${2}.sh"
    chmod +x mac-${2}.sh
    . mac-${2}.sh

    if [ ${1} = "install" ]; then
        install
    fi

    if [ ${1} = "uninstall" ]; then
        uninstall
    fi
}
