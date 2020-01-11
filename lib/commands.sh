#!/usr/bin/env bash


cliarg() {
    if [ ${1} = "ls" ]; then
        ls -a
    fi

    if [ ${1} = "chmod+dev" ]; then
        source ~/.setuptools/lib/masterdev.sh
    fi
}