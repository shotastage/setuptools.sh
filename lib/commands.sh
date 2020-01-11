#!/usr/bin/env bash


cliarg() {

    if [ ${1} = "exit" ]; then
        echo "Terminating session..."
    fi

    if type $1 > /dev/null 2>&1; then
        echo $1
        `$1`
    else
        echo "This command does not exist!"
    fi
}
