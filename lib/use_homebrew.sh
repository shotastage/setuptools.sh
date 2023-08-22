#!/usr/bin/env bash

use_homebrew() {
    if which brew > /dev/null 2>&1; then
        echo "Use Homebrew."
    else
        echo "Homebrew is not installed."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}
