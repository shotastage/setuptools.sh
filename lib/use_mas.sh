#!/usr/bin/env bash

use_mas() {
    if which mas > /dev/null 2>&1; then
        echo "Use Mas."
    else
        echo "Mas is not installed."
        brew update
        brew install mas
    fi
}
