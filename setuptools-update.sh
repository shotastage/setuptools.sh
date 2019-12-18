#!/usr/bin/env bash
set -e


# PREPARE
cd $HOME
if [ -e .setuptools_update_tmp/ ]; then
    echo "Update temporary already exists! Remove this directory before starting update."
    rm -rf .setuptools_update_tmp/
fi
mkdir .setuptools_update_tmp
cd .setuptools_update_tmp

echo "⬇️  Downloading newest package..."
git clone --quiet https://github.com/shotastage/setuptools.sh.git >> /dev/null
cd setuptools.sh


rm -rf $HOME/.setuptools/lib/

echo "🔄  Updating setuptools..."
cp -rf ./lib/ $HOME/.setuptools/lib/
cp -f setuptools.sh $HOME/.setuptools/bin/setuptools
cp -f setuptools.sh $HOME/.setuptools/bin/uptool
cp -f setuptools-update.sh $HOME/.setuptools/bin/setuptools-update
cp -f setuptools-help.sh $HOME/.setuptools/bin/setuptools-help


cd $HOME
rm -rf .setuptools_update_tmp/
echo "🆗  Update completed!"
