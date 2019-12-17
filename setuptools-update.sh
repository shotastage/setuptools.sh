#!/usr/bin/env bash
set -e
cd $HOME/.setuptools/bin/


rm setuptools
rm setuptools-update

curl -O https://raw.githubusercontent.com/shotastage/setuptools.sh/master/setuptools.sh
curl -O https://raw.githubusercontent.com/shotastage/setuptools.sh/master/setuptools-update.sh
mv setuptools.sh setuptools
mv setuptools-update.sh setuptools-update
chmod +x setuptools
chmod +x setuptools-update
