#!/usr/bin/env bash
STRATEGY_VERSION="v001"


function install {
    echo "⬇️  Downloading application..."
    curl -OL "https://downloads.slack-edge.com/linux_releases/slack-desktop-4.2.0-amd64.deb"
    if [ -e slack-desktop-4.2.0-amd64.deb ]; then
        echo "⬇️  Installing application..."
        sudo dpkg -i slack-desktop-4.2.0-amd64.deb
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi
}

function uninstall {
    echo "NOW UNDER CONSTRUCTION."
}

function update {
    echo "NOW UNDER CONSTRUCTION."
}

function main {
    install
}