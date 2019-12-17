#!/usr/bin/env bash

function prepare_toolchain {
    if [ ! -e $HOME/.setuptools/toolchains/ ]; then
        mkdir -p $HOME/.setuptools/toolchains/
    fi
}

function install_toolchain {
    mv $1 $HOME/.setuptools/toolchains/$1
}
