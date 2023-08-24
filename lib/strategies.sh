#!/usr/bin/env bash


. $HOME/.setuptools/lib/platform.sh

search_strategy() {
    echo "🔎  Searching..."

    files=$(curl -s "https://api.github.com/repos/shotastage/setuptools.sh/git/trees/main?recursive=1" | \
            grep -Eo 'strategies/'$(operating_system)'/.+\.sh"')

    matching_files=$(echo "$files" | grep "${1}" | sed 's/"//g' | awk -F/ '{print $NF}' | sed 's/\.sh//g')

    if [ -z "$matching_files" ]; then
        echo "❌  Strategy $1 does not exists!"
    else
        echo "⭕️  Strategy candidates found:"
        echo "$matching_files"
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
