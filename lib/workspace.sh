#!/usr/bin/env bash

WORKING_DIRECTORY=~/.setuptools

function initialize {
    if [ -e $WORKING_DIRECTORY ]; then
        echo "Date: $(date)    User: $(whoami)" >> $WORKING_DIRECTORY/exec_user_log
    else
        make_directories
    fi
}


function prepare_workspace {
    if [! -e $WORKING_DIRECTORY ]; then
        make_directories
    fi

    if [! -e $WORKING_DIRECTORY/strategies/ ]; then
        make_directories
    fi
}


function make_directories {
    echo "Initializing..."
    mkdir $WORKING_DIRECTORY
    mkdir -p $WORKING_DIRECTORY/strategies/
    mkdir -p $WORKING_DIRECTORY/toolchains/
    mkdir -p $WORKING_DIRECTORY/bin/
}