#!/usr/bin/env bash
STRATEGY_VERSION="v001"

architecture=$(dpkg --print-architecture)


function install {

    if [ "$architecture" == "arm64" ]; then
        echo "Currently, Google Chrome does not support ARM64 CPU. Thus, Chromium (OSS Chrome build) will be installed instead."
        sudo apt-get install -y install chromium-browser
        exit 0
    fi

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

    echo "🧹  Cleaning..."
    rm -f google-chrome-stable_current_amd64.deb
}

function uninstall {
    if [ "$architecture" == "arm64" ]; then
        sudo apt-get remove chromium-browser --purge
    fi

    sudo apt-get remove google-chrome-stable --purge
}

function update {
    if [ "$architecture" == "arm64" ]; then
        sudo apt-get install chromium-browser
    fi
    sudo apt-get install google-chrome-stable -y
}

function main {
    install
}
