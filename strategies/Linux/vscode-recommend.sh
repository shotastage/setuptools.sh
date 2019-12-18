#!/usr/bin/env bash

STRATEGY_VERSION="v001"

function install {
    echo "⬇️ Download & install Visual Code Studio essential extensions..."
    code --install-extension vscode-icons-team.vscode-icons
    code --install-extension ms-vsliveshare.vsliveshare
    code --install-extension jolaleye.horizon-theme-vscode
    code --install-extension ms-python.python
    code --install-extension msjsdiag.vscode-react-native
    code --install-extension ms-vscode-remote.remote-ssh
}

function uninstall {
    echo "THIS IS UNINSTALL SECTION..."
}

function update {
    echo "THIS IS UPDATE SECTION..."
}

function main {
    install
}
