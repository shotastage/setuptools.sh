#!/usr/bin/env bash
set -e


. $HOME/.setuptools/lib/platform.sh


WORKING_DIRECTORY=~/.setuptools
MASTER_URL="https://raw.githubusercontent.com/shotastage/setuptools.sh/master/strategies/$(operating_system)"

execute() {
    cd $WORKING_DIRECTORY/strategies/
    curl --silent -O "${MASTER_URL}/${2}.sh"
    chmod +x ${2}.sh
    . ${2}.sh

    if [ ${1} = "install" ]; then
        install
    fi

    if [ ${1} = "update" ]; then
        update
    fi

    if [ ${1} = "uninstall" ]; then
        uninstall
    fi
}


exetask() {
    $WORKING_DIRECTORY/strategies/
    curl --silent "${MASTER_URL}/${2}.sh" -o $WORKING_DIRECTORY/tasks/${2}.sh
    chmod +x $WORKING_DIRECTORY/tasks/${2}.sh
    . $WORKING_DIRECTORY/tasks/${2}.sh

    uptask
}
