#!/usr/bin/env bash

WORKING_DIRECTORY=~/.setuptools

function initialize {
    if [ -e $WORKING_DIRECTORY ]; then
        echo "Date: $(date)    User: $(whoami)" >> $WORKING_DIRECTORY/exec_user_log
    else
        echo "Initializing..."
        mkdir $WORKING_DIRECTORY
        mkdir -p $WORKING_DIRECTORY/strategies/
        mkdir -p $WORKING_DIRECTORY/toolchains/
        mkdir -p $WORKING_DIRECTORY/bin/
    fi
}


function prepare_workspace {
    if [ -e $WORKING_DIRECTORY ]; then
        return
    fi

    if [ -e $WORKING_DIRECTORY/strategies/ ]; then
        return
    fi

    initialize
}
