#!/usr/bin/env bash

STRATEGY_VERSION="v001"


function install {
    if [ -e /Applications/balenaEtcher.app ]; then
        echo "🖥  balenaEtcherはすでにインストールされています."
        return
    fi
    echo "⬇️  balenaEtcherをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://github.com/balena-io/etcher/releases/download/v1.5.70/balenaEtcher-1.5.70.dmg"
    if [ -e balenaEtcher-1.5.70.dmg ]; then
        echo "💿  イメージをマウントしています..."
        hdiutil mount balenaEtcher-1.5.70.dmg >> /dev/null
        echo "⬇️  アプリケーションをインストールしています..."
        cp -r /Volumes/balenaEtcher\ 1.5.70/balenaEtcher.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "💿  イメージをアンマウントしています..."
    umount /Volumes/balenaEtcher\ 1.5.70/ >> /dev/null
    echo "🧹  クリーンアップしています..."
    rm balenaEtcher-1.5.70.dmg
}

function uninstall {
    cd /Applications/
    echo "🧹  Removing appliation..."
    rm -rf balenaEtcher.app
    echo "🧹  Cleaning remaining files..."
    rm -rf ~/Library/Preferences/io.balena.etcher.plist
    rm -rf ~/Library/Saved Application State/io.balena.etcher.savedState
    echo "🧹  Uninstall completed!"
}

function update {
    echo "NOW UNDER CONSTRUCTION."
}

function main {
    install
}
