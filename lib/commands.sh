#!/usr/bin/env bash


cliarg() {
    if [ ${1} = "ls" ]; then
        ls -a
    fi

    if [ ${1} = "ll" ]; then
        ls -la
    fi

    if [ ${1} = "echo" ]; then
        echo $2
    fi

    if [ ${1} = "chmod+dev" ]; then
        source ~/.setuptools/lib/masterdev.sh
    fi
}
