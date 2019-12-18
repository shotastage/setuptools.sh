#!/usr/bin/env bash

STRATEGY_VERSION="v001"


function install {
    install_required_pkg
    setup_mactex
    vscode
}

function uninstall {
    brew cask uninstall mactex-no-gui
}

function update {
    echo "🍺  Homebrewをアップデートしています..."
    brew update
    echo "🍺  MacTexをアップデートしています..."
    brew upgrade mactex-no-gui
    echo "📃  MacTexのパッケージをアップデートしています..."
    sudo tlmgr update --self --all
}


function install_required_pkg {
    echo "🍺  Homebrewをアップデートしています...."
    brew update
    echo "🍺  MacTexをインストールしています..."
    brew cask install mactex-no-gui
}

function setup_mactex {
    echo "📃  パスを設定しています..."
    /usr/local/texlive/2019/bin/x86_64-darwin/tlmgr path add
    echo "📃  MacTexのパッケージをアップデートしています..."
    sudo tlmgr update --self --all
    echo "📃  MacTexはデフォルトでA4用紙サイズを使用します"
    sudo tlmgr paper a4
}

function vscode {
    if [ -e /Applications/Visual\ Studio\ Code.app ]; then
        echo "⬇️  TexWorkshopをインストールしています..."
        /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension james-yu.latex-workshop
    fi
}

function main {
    install_required_pkg
    setup_mactex
    vscode
}
