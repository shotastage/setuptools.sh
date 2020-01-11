#!/usr/bin/env bash


. ~/.setuptools/lib/masterdev.sh


cliarg() {

    if [ ${1} = "exit" ]; then
        echo "Terminating session..."
        return
    fi

    if [ ${1} = "back" ]; then
        cd ..
        return
    fi

    if [ ${1} = "signall" ]; then
        sign_master
        return
    fi

    if type $1 > /dev/null 2>&1; then
        eval $@
    else
        echo "This command does not exist!"
    fi
}
