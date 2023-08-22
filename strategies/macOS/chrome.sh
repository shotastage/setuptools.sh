#!/usr/bin/env bash

STRATEGY_VERSION="v001"

. ~/.setuptools/lib/foundation.sh
. ~/.setuptools/lib/use_homebrew.sh

install() {
    if [ -e /Applications/Google\ Chrome.app/ ]; then
        echo "🖥  Chromeはすでにインストールされています."
        return
    fi

    use_homebrew
    brew install --cask google-chrome  
}

uninstall() {
    use_homebrew
    brew uninstall google-chrome
}

update() {
    echo "Google Chrome has self-updating tool. Please check or update on the About page."
}

main() {
    install
}
