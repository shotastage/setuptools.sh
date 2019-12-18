#!/usr/bin/env bash
STRATEGY_VERSION="v001"


function install {
    echo "⬇️  Downloading application..."
    curl -OL "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    if [ -e google-chrome-stable_current_amd64.deb ]; then
        echo "⬇️  Installing application..."
        sudo apt install ./google-chrome-stable_current_amd64.deb
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi
}

function uninstall {
    sudo apt-get remove google-chrome-stable --purge
}

function update {
    sudo apt-get install google-chrome-stable -y
}

function main {
    install
}
