#!/usr/bin/env bash

STRATEGY_VERSION="v001"

. ~/.setuptools/lib/foundation.sh

function install {
    if [ -e /Applications/Skype.app/ ]; then
        echo "🖥  Skypeはすでにインストールされています."
        return
    fi
    echo "⬇️  Skypeをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://downloads.skype.com/s4l/download/mac/Skype-8.55.0.141.dmg"
    if [ -e Skype-8.55.0.141.dmg ]; then
        echo "💿  イメージをマウントしています..."
        dmg Skype-8.55.0.141.dmg
        echo "⬇️  アプリケーションをインストールしています..."
        cp -r /Volumes/Skype/Skype.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "💿  イメージをアンマウントしています..."
    defer_dmg Skype
    echo "🧹  クリーンアップしています..."
    rm Skype-8.55.0.141.dmg
}

function uninstall {
    cd /Applications/
    rm -rf Skype.app
}

function update {
    echo "NOW UNDER CONSTRUCTION!"
}

function main {
    install
}
