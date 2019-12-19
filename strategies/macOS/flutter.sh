#!/usr/bin/env bash

STRATEGY_VERSION="v001"

. ../lib/toolchain.sh
. ../lib/fish.sh

function install {
    echo "⬇️  Downloading package..."
    curl -LO https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_v1.12.13+hotfix.5-stable.zip
    echo "📦  Extracting package..."
    unzip flutter_macos_v1.12.13+hotfix.5-stable.zip >> /dev/null
    prepare_toolchain
    install_toolchain flutter
    add_path
    flutter doctor
    echo "🧹  Cleaning..."
    rm flutter_macos_v1.12.13+hotfix.5-stable.zip
    
    if [ -e /Applications/Visual\ Studio\ Code.app/ ]; then
        echo "📝  Setup Visual Studio Code extension...."
        /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension dart-code.flutter
    fi
    echo "👍🏻  Installation completed!"
}

function uninstall {
    echo "Uninstall strategy does not exists!"
}

function update {
    flutter upgrade
}

function add_path {
    echo "" >> $HOME/.bash_profile
    echo "################ Flutter SDK ################" >> $HOME/.bash_profile
    echo "export PATH=\$PATH:~/.setuptools/toolchains/flutter/bin" >> $HOME/.bash_profile
    add_fish_path "\$HOME/.setuptools/toolchains/flutter/bin"
    rm fish_adding_script.fish
}

function main {
    install
}
