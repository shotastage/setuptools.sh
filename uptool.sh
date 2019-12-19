#!/usr/bin/env bash
set -e

WORKING_DIRECTORY=~/.setuptools


splash() {
    echo "setuptools 1.1.0"
    echo "Copyright (C) 2019 Shota Shimazu, All rights reserved."
    echo
}

cd $WORKING_DIRECTORY

. $WORKING_DIRECTORY/lib/workspace.sh
. $WORKING_DIRECTORY/lib/executor.sh
. $WORKING_DIRECTORY/lib/strategies.sh
. $WORKING_DIRECTORY/lib/configure.sh

splash 
initialize
prepare_workspace



if [ ${1} = "install" ] || [ ${1} = "i" ]; then
    execute install $2
    exit 0
fi


if [ ${1} = "uninstall" ]; then

    execute uninstall $2
    exit 0
fi

if [ ${1} = "update" ] || [ ${1} = "u" ]; then
    if [ ${2} = "self" ]; then
        setuptools-update
        exit 0
    fi

    execute update $2
    exit 0
fi

if [ ${1} = "search" ] || [ ${1} = "s" ]; then
    search_strategy $2
    exit 0
fi

if [ ${1} = "configure" ]; then
    echo "🔄  Generating configuration..."
    configure
    exit 0
fi

if [ ${1} = "help" ] || [ ${1} = "h" ]; then
    setuptools-help
    exit 0
fi

if [ ${1} = "version" ] || [ ${1} = "v" ]; then
    echo
    echo "setuptools 1.1.0"
    echo "Copyright (C) 2019 Shota Shimazu, All rights reserved."
    echo 
    exit 0
fi

if [ ${1} = "show-user-log" ]; then
    cat $WORKING_DIRECTORY/exec_user_log
    exit 0
fi

if [ ${1} = "--clear-strategies" ]; then
    cd strategies
    rm -rf *
    exit 0
fi
