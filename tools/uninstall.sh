#!/usr/bin/env bash
set -e

if [ ${1} = "--purge" ]; then
    rm -rf .setuptools/
    echo "🆗  Completely uninstalled setuptools."
    exit 0
fi

if [ -e $HOME/.setuptools/ ]; then
    cd $HOME/.setuptools/
    mv toolchains $HOME/.uptool_toolchains_backup/
    cd
    rm -rf .setuptools/
    exit 0
fi

echo "setuptools doesn't exists!"
exit 1
