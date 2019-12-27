#!/usr/bin/env bash
set -e


. $HOME/.setuptools/lib/platform.sh
. $HOME/.setuptools/lib/codesign.sh


WORKING_DIRECTORY=~/.setuptools
MASTER_URL="https://raw.githubusercontent.com/shotastage/setuptools.sh/master/strategies/$(operating_system)"
TASK_MASTER_URL="https://raw.githubusercontent.com/shotastage/setuptools.sh/master/task/$(operating_system)"


execute() {
    cd $WORKING_DIRECTORY/strategies/
    curl --silent -O "${MASTER_URL}/${2}.sh"
    chmod +x ${2}.sh

    verify_script ${2}.sh "https://raw.githubusercontent.com/shotastage/setuptools.sh/master/strategies/$(operating_system)/signatures/${2}.sh.sig"


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

    if [ ! -e $WORKING_DIRECTORY/tasks/ ]; then
        mkdir $WORKING_DIRECTORY/tasks/
    fi

    curl --silent "${TASK_MASTER_URL}/${1}.sh" -o $WORKING_DIRECTORY/tasks/${1}.sh
    chmod +x $WORKING_DIRECTORY/tasks/${1}.sh
    . $WORKING_DIRECTORY/tasks/${1}.sh

    uptask
}
