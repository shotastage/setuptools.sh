#!/usr/bin/env bash

. lib/toolchain.sh

function install {
    #curl -LO https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_v1.12.13+hotfix.5-stable.zip
    #unzip flutter_macos_v1.12.13+hotfix.5-stable.zip >> /dev/null
    prepare_toolchain
    #install_toolchain
    #flutter doctor
}

function main {
    install
}

main
