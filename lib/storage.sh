#!/usr/bin/env bash
set -e

. $HOME/.setuptools/lib/platform.sh

initialize_storage() {
    if [ ! -e $HOME/.setuptools/lib/storage/ ]; then
        mkdir -p $HOME/.setuptools/lib/storage/
    fi

    touch $HOME/.setuptools/lib/storage/storage.idx
}

install_file() {
    cp -r $1 $HOME/.setuptools/storage/
}

install_storage_application() {

}

digest_files() {

}
