#!/usr/bin/env bash


. ~/.setuptools/lib/platform.sh
. ~/.setuptools/lib/codesign.sh


initialize_storage() {
    if [ ! -e $HOME/.setuptools/storage/ ]; then
        mkdir -p $HOME/.setuptools/storage/
    fi

    touch $HOME/.setuptools/storage/storage.idx
}

_register_storage_app() {
    if [ -e ~/.setuptools/storage/$1 ]; then
        echo "Write record" >> ~/.setuptools/storage/$1/history
    else
        echo "Registering application..."
        mkdir -p ~/.setuptools/storage/$1
    fi
}

digest_files() {
    echo "Calclating hash..."
}

install_file() {
    _register_storage_app $1
    cp -r $2 $HOME/.setuptools/storage/$1/$2
}

upstorage_path() {
    echo "${HOME}/.setuptools/storage/${1}/${2}"
}


upstorage_dirpath() {
    echo "${HOME}/.setuptools/storage/${1}/"
}
