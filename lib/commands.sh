#!/usr/bin/env bash


cliarg() {

    if [ ${1} = "exit" ]; then
        echo "Terminating session..."
    fi

    if type $1 > /dev/null 2>&1; then
        eval "$(IFS=" "; echo "${@[*]}")"
    else
        echo "This command does not exist!"
    fi
}
