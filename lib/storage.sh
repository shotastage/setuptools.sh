#!/usr/bin/env bash
set -e


. $HOME/.setuptools/lib/platform.sh


initialize_storage() {

}

install_file() {
    cp -r $1 $HOME/.setuptools/storage/
}

digest_files() {

}
