#!/usr/bin/env bash


function search_strategy {
    res=`curl -LI https://raw.githubusercontent.com/shotastage/setuptools.sh/master/mac-${1}.sh -w '%{http_code}\n' -s -o /dev/null`
    if [ 404 = "${res}" ]; then
        echo "Strategy $1 does not exists!" 
    else
        echo "Strategy $1 found!"
    fi
}
