#!/usr/bin/env bash

. ~/.setuptools/lib/foundation.sh
. ~/.setuptools/lib/toolchain.sh


STRATEGY_VERSION="v002"
PLATFORM="macOS"

DESCRIPTION=`cat << EOS
This is dummy strategy for macOS.
EOS
`

HELP=`cat << EOS
This is dummy strategy for macOS.
EOS
`

install() {
    curl -O https://raw.githubusercontent.com/shotastage/shota-no-open-memo/master/memo-next.sh
    chmod +x memo-next.sh
    mkdir -p ./somemo/bin/
    mv memo-next.sh ./somemo/bin/memo

    prepare_toolchain
    install_toolchain somemo

    if [ -e $HOME/.bash_profile ]; then
        echo "🖊  Adding Bash path..."
        echo "############### setuptools ###############" >> $HOME/.bash_profile
        echo "export PATH=\$PATH:~/.setuptools/toolchains/somemo/bin" >> $HOME/.bash_profile
    fi


    if [ -e $HOME/.bashrc ]; then
        echo "🖊  Adding Bash path..."
        echo "############### setuptools ###############" >> $HOME/.bashrc
        echo "export PATH=\$PATH:~/.setuptools/toolchains/somemo/bin" >> $HOME/.bashrc
    fi

    if [ -e $HOME/.zshenv ]; then
        echo "🖊  Adding Zsh path..."
        echo "############### setuptools ###############" >> $HOME/.zshenv
        echo "export PATH=\$PATH:~/.setuptools/toolchains/somemo/bin" >> $HOME/.zshenv
    fi
}

uninstall() {
    echo "This is uninstall section..."
}

update() {
    rm -rf ~/setuptools/toolchains/somemo/
    curl -O https://raw.githubusercontent.com/shotastage/shota-no-open-memo/master/memo-next.sh
    chmod +x memo-next.sh
    mkdir -p ./somemo/bin/
    mv memo-next.sh ./somemo/bin/memo

    prepare_toolchain
    install_toolchain somemo
}
