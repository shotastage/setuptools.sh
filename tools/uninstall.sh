#!/usr/bin/env bash
set -e

if [ -e $HOME/.setuptools/ ]; then
    cd $HOME/.setuptools/
    mv toolchains $HOME/.uptool_toolchains_backup/
    cd
    rm -rf .setuptools/
    exit 0
fi

echo "setuptools doesn't exists!"
exit 1
