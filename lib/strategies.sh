#!/usr/bin/env bash


. $HOME/.setuptools/lib/platform.sh

search_strategy() {
    echo "🔎  Searching..."
    res=`curl -LI https://raw.githubusercontent.com/shotastage/setuptools.sh/main/strategies/$(operating_system)/${1}.sh -w '%{http_code}\n' -s -o /dev/null`
    if [ 404 = "${res}" ]; then
        echo "❌  Strategy $1 does not exists!"
    else
        echo "⭕️  Strategy $1 found!"
    fi
}

list_strategies() {
    echo "Cached strategies:"
    echo
    for fname in $HOME/.setuptools/strategies/*.sh; do
        basename $fname .sh
    done
}

clear_strategies() {
    for fname in $HOME/.setuptools/strategies/*.sh; do
        echo "Clearing $(basename $fname)..."
        rm -f $fname
    done

    for fname in $HOME/.setuptools/strategies/*.sig; do
        echo "Clearing $(basename $fname)..."
        rm -f $fname
    done
    echo "🗑  All cached strategies has been removed."
}
