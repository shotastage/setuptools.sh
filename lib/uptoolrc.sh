#!/usr/bin/env bash


load_rcfile() {
    source ~/.uptoolrc
}

make_rcfile() {
    touch ~/.uptoolrc
    echo "##################### Setuptools RC File #####################" >> ~/.uptoolrc
    echo "CREATOR_VERSION=\"0001\"" >> ~/.uptoolrc
    echo >> ~/.uptoolrc
}
