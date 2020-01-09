#!/usr/bin/env bash

. ~/.setuptools/lib/foundation.sh


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
    echo "This is install section..."
}

uninstall() {
    echo "This is uninstall section..."
}

update() {
    echo "This is update section..."
}
