#!/usr/bin/env bash

STRATEGY_VERSION="v001"

function install {
    echo "THIS SCRIPT IS NOW UNDER CONSTRUCION!!!!!!!"
    exit 1

    if [ -e /Applications/VirtualBox.app ]; then
        echo "🖥  VirtualBoxはすでにインストールされています."
        return
    fi
    echo "⬇️  VirtualBoxをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://download.virtualbox.org/virtualbox/6.1.0/VirtualBox-6.1.0-135406-OSX.dmg"
    if [ -e OperaSetup.zip ]; then
        echo "📦  インストーラを展開しています..."
        unzip OperaSetup.zip >> /dev/null
        echo "🚀  インストーラを起動しています..."
        open -W Opera\ Installer.app
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "🧹  クリーンアップしています..."
    rm OperaSetup.zip
    rm -rf Opera\ Installer.app
    rm ._Opera\ Installer.app
}

function uninstall {
    echo "THIS SCRIPT IS NOW UNDER CONSTRUCION!!!!!!!"
    exit 1
}

function update {
    echo "THIS SCRIPT IS NOW UNDER CONSTRUCION!!!!!!!"
    exit 1
}

function main {
    install
}
