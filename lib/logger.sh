#!/usr/bin/env bash


log() {
    echo "None"
}


pick_icon() {
    for OPT in "$@"
    do
        case $OPT in
            download )
                echo "⬇️"
                ;;
        esac
    done
}