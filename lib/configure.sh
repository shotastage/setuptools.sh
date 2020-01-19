#!/usr/bin/env bash

. ~/.setuptools/lib/platform.sh

configure() {

    PLATFORM=`operating_system`

    if [ -e $HOME/.setuptools/config/master ]; then
        rm -f $HOME/.setuptools/config/master
    fi
    touch $HOME/.setuptools/config/master

    if [ ${PLATFORM} = "macOS" ]; then
        echo "PLATFORM=macOS" >> $HOME/.setuptools/config/master
    fi
}


initialize_configure() {
    if [ ! -e ~/.setuptools/config/ ]; then
        echo "Initializing config directory..."
        mkdir -p ~/.setuptools/config/
    fi
}


register_config() {
    if [ ! -e ~/.setuptools/config/$1 ]; then
        touch ~/.setuptools/config/$1
        echo "########### ${1}" >> ~/.setuptools/config/$1
    fi
}

write_config() {
    echo "${2}=${3}" >> ~/.setuptools/config/$1
}

inject_config() {
    . ~/.setuptools/config/${1}
}
