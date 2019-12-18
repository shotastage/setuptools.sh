#!/usr/bin/env bash

STRATEGY_VERSION="v001"

function install {
    echo "⬇️ Download & install Visual Code Studio essential extensions..."
    /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension vscode-icons-team.vscode-icons
    /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension ms-vsliveshare.vsliveshare
    /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension jolaleye.horizon-theme-vscode
    /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension ms-python.python
    /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension msjsdiag.vscode-react-native
    /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension ms-vscode-remote.remote-ssh
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
