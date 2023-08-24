#!/usr/bin/env bash


. $HOME/.setuptools/lib/platform.sh

search_task() {
    echo "🔎  Searching..."
    res=`curl -LI https://raw.githubusercontent.com/shotastage/setuptools.sh/main/task/$(operating_system)/${1}.sh -w '%{http_code}\n' -s -o /dev/null`
    if [ 404 = "${res}" ]; then
        echo "❌  Task $1 does not exists!" 
    else
        echo "⭕️  Task $1 found!"
    fi
}

list_tasks() {
    echo "Cached tasks:"
    echo
    for fname in $HOME/.setuptools/tasks/*.sh; do
        basename $fname .sh
    done
}

clear_tasks() {
    for fname in $HOME/.setuptools/tasks/*.sh; do
        rm -f $fname
    done
    echo "🗑  All cached tasks has been removed."
}
