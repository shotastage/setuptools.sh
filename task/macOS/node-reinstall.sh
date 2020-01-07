#!/usr/bin/env bash

uptask() {
    if [ -e node_modules/ ]; then
        rm -rf node_modules/
    fi

    yarn
}
