#!/usr/bin/env bash
STRATEGY_VERSION="v001"


function install {
    echo "⬇️  Downloading application..."
    curl -L "https://go.microsoft.com/fwlink/?LinkID=760868" -o code.deb
    if [ -e code.deb ]; then
        echo "⬇️  Installing application..."
        sudo apt install ./code.deb
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "🧹  Cleaning..."
    rm -f code.deb
}

function uninstall {
    sudo apt-get purge code
}

function update {
    sudo apt-get install code -y
}

function main {
    install
}
