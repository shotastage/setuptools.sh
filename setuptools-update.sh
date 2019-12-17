#!/usr/bin/env bash
set -e


# PREPARE
cd $HOME
mkdir .setuptools_update_tmp
cd .setuptools_update_tmp

echo "⬇️  Downloading newest package..."
git clone --quiet https://github.com/shotastage/setuptools.sh.git >> /dev/null
cd setuptools.sh


echo "🔄  Updating setuptools..."
cp -rf ./lib/ $HOME/.setuptools/lib/
cp -f setuptools.sh $HOME/.setuptools/bin/setuptools
cp -f setuptools.sh $HOME/.setuptools/bin/uptool
cp -f setuptools-update.sh $HOME/.setuptools/bin/setuptools-update


cd $HOME
rm -rf .setuptools_update_tmp/
