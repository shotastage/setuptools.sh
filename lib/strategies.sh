#!/usr/bin/env bash


. $HOME/.setuptools/lib/platform.sh

search_strategy() {
    echo "🔎  Searching..."
    res=`curl -LI https://raw.githubusercontent.com/shotastage/setuptools.sh/master/strategies/$(operating_system)/${1}.sh -w '%{http_code}\n' -s -o /dev/null`
    if [ 404 = "${res}" ]; then
        echo "❌  Strategy $1 does not exists!" 
    else
        echo "⭕️  Strategy $1 found!"
    fi
}


clear_strategies() {
    for fname in $HOME/.setuptools/strategies/*.sh; do
        rm -f $fname
    done
}
