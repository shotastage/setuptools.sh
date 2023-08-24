#!/usr/bin/env bash


. $HOME/.setuptools/lib/platform.sh

search_strategy() {
    echo "🔎  Searching..."

    sfiles=$(curl -s "https://api.github.com/repos/shotastage/setuptools.sh/git/trees/main?recursive=1" | \
            grep -Eo 'strategies/'$(operating_system)'/.+\.sh"')

    smatching_files=$(echo "$sfiles" | grep "${1}" | sed 's/"//g' | awk -F/ '{print $NF}' | sed 's/\.sh//g')

    tfiles=$(curl -s "https://api.github.com/repos/shotastage/setuptools.sh/git/trees/main?recursive=1" | \
            grep -Eo 'task/'$(operating_system)'/.+\.sh"')

    tmatching_files=$(echo "$tfiles" | grep "${1}" | sed 's/"//g' | awk -F/ '{print $NF}' | sed 's/\.sh//g')

    if [ -z "$smatching_files" ]; then
        echo
        echo "❌  No strategy found!"
        echo
    else
        echo
        echo "📦 Strategies:"
        echo "$smatching_files"
        echo
    fi

    if [ -z "$tmatching_files" ]; then
        echo "❌  No task found!"
        echo
    else
        echo "🛠️  Tasks:"
        echo "$tmatching_files"
        echo
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

    for fname in $HOME/.setuptools/tasks/*.sh; do
        echo "Clearing $(basename $fname)..."
        rm -f $fname
    done

    for fname in $HOME/.setuptools/tasks/*.sig; do
        echo "Clearing $(basename $fname)..."
        rm -f $fname
    done
    echo "🗑  All cached strategies and tasks has been removed."
}
