#!/usr/bin/env bash
set -e


WORKSPACE=~/.setuptools_update_tmp/

preapre_tmp() {
    cd $HOME

    if [ -e $WORKSPACE ]; then
        rm -rf $WORKSPACE
    fi

    mkdir $WORKSPACE
}

download() {
    echo "⬇️  Downloading newest package..."
    git clone --quiet https://github.com/shotastage/setuptools.sh.git $WORKSPACE/netinst/ >> /dev/null
}

destory_old() {
    rm -rf $HOME/.setuptools/lib/
    rm -rf $HOME/.setuptools/bin/
}

install_new() {
    cp -rf $WORKSPACE/netinst/lib/ $HOME/.setuptools/lib/
    cp -f $WORKSPACE/netinst/setuptools.sh $HOME/.setuptools/bin/uptool
    cp -f $WORKSPACE/netinst/setuptools-update.sh $HOME/.setuptools/bin/setuptools-update
    cp -f $WORKSPACE/netinst/setuptools-help.sh $HOME/.setuptools/bin/setuptools-help
}

# PREPARE
cd $HOME

preapre_tmp
download
echo "🔄  Updating setuptools..."
destory_old
install_new


cd $HOME
rm -rf .setuptools_update_tmp/
echo "🆗  Update completed!"
