#!/usr/bin/env bash

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
    echo "👍🏻  Installation completed!"
}

function uninstall {
    echo "Uninstall strategy does not exists!"
}

function update {
    echo "Update strategy does not exists!"
}

function add_path {
    echo "" >> $HOME/.bash_profile
    echo "################ Flutter SDK ################" >> $HOME/.bash_profile
    echo "export PATH=\$PATH:~/.setuptools/toolchains/flutter/bin" >> $HOME/.bash_profile
    add_fish_path "\$HOME/.setuptools/toolchains/flutter/bin"
}

function main {
    install
}
