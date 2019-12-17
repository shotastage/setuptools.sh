#!/usr/bin/env bash

STRATEGY_VERSION="v001"


function install {
    if [ -e /Applications/Google\ Chrome.app/ ]; then
        echo "🖥  Chromeはすでにインストールされています."
        return
    fi
    echo "⬇️  Chromeをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://dl.google.com/chrome/mac/stable/CHFA/googlechrome.dmg"
    if [ -e googlechrome.dmg ]; then
        sudo dpkg -i google-chrome.deb
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi
}

function uninstall {
    cd /Applications/
    rm -rf Google\ Chrome.app
}

function update {
    echo "NOW UNDER CONSTRUCTION!"
}

function main {
    install
}
