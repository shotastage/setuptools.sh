#!/usr/bin/env bash
set -e

WORKING_DIRECTORY=~/.setuptools/


function splash {
    echo "setuptools 1.0.0"
    echo "Copyright (C) 2019 Shota Shimazu, All rights reserved."
    echo
}


function in_workspace {
    cd $WORKING_DIRECTORY
}

in_workspace
. ./lib/workspace.sh
. ./lib/executor.sh
. ./lib/strategies.sh

splash
initialize
prepare_workspace



if [ ${1} = "install" ]; then
    execute install $2
    exit 0
fi


if [ ${1} = "uninstall" ]; then

    execute uninstall $2
    exit 0
fi

if [ ${1} = "update" ]; then
    if [ ${2} = "self" ]; then
        setuptools-update
        exit 0
    fi

    execute update $2
    exit 0
fi


if [ ${1} = "--clear-strategies" ]; then
    cd strategies
    rm -rf *
    exit 0
fi

if [ ${1} = "search" ]; then
    search_strategy $2
    exit 0
fi

if [ ${1} = "show-user-log" ]; then
    cat $WORKING_DIRECTORY/exec_user_log
    exit 0
fi
