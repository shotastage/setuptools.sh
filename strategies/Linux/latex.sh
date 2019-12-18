#!/usr/bin/env bash

STRATEGY_VERSION="v001"


function install {
    install_required_pkg
    vscode
}

function uninstall {
    sudo apt-get purge texlive-full texlive-lang-cjk xdvik-ja evince texlive-fonts-recommended texlive-fonts-extra
}

function update {
    echo "🐧  APTインデックスをアップデートしています...."
    sudo apt-get update -y
    echo "🐧  TexLiveをアップデートしています..."
    sudo apt install texlive-full
    echo "🐧  Updating additional packages..."
    sudo apt install texlive-lang-cjk xdvik-ja evince
    sudo apt install texlive-fonts-recommended texlive-fonts-extra
}


function install_required_pkg {
    echo "🐧  APTインデックスをアップデートしています...."
    sudo apt-get update -y
    echo "🐧  TexLiveをインストールしています..."
    sudo apt install texlive-full
    echo "🐧  Installing additional packages..."
    sudo apt install texlive-lang-cjk xdvik-ja evince
    sudo apt install texlive-fonts-recommended texlive-fonts-extra
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
    if [ -e /usr/bin/code ]; then
        echo "⬇️  TexWorkshopをインストールしています..."
        code --install-extension james-yu.latex-workshop
    fi
}

function main {
    install_required_pkg
    setup_mactex
    vscode
}
