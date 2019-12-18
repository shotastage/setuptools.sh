#!/usr/bin/env bash


. $HOME/.setuptools/lib/platform.sh

function search_strategy {
    echo "🔎  Searching..."
    res=`curl -LI https://raw.githubusercontent.com/shotastage/setuptools.sh/master/strategies/$(operating_system)/${1}.sh -w '%{http_code}\n' -s -o /dev/null`
    if [ 404 = "${res}" ]; then
        echo "Result: Strategy $1 does not exists!" 
    else
        echo "Result: Strategy $1 found!"
    fi
}
