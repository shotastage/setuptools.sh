#!/usr/bin/env bash

function prepare_toolchain {
    if [ ! -e $HOME/.setuptools/toolchains/ ]; then
        mkdir -p $HOME/.setuptools/toolchains/
    fi
}

function install_toolchain {
    if [ -e $HOME/.setuptools/toolchains/$1 ]; then
        echo "🌞  $1 Toolchain is already exists!"
        echo "Replace $1 to newer version."
        rm -rf $HOME/.setuptools/toolchains/$1
    fi

    mv $1 $HOME/.setuptools/toolchains/$1
}

function uninstall_toolchain {
    if [ -e $HOME/.setuptools/toolchains/$1 ]; then
        rm -rf $HOME/.setuptools/toolchains/$1
    else
        echo "🌞  Toolchain $1 does not exists!"
    fi
}
