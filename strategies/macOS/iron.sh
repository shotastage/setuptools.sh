#!/usr/bin/env bash

STRATEGY_VERSION="v001"

. ~/.setuptools/lib/foundation.sh

install() {
    if [ -e /Applications/Chromium.app/ ]; then
        echo "🖥  SRWare Ironはすでにインストールされています."
        return
    fi
    echo "⬇️  SRWare Ironをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://www.srware.net/downloads/iron-mac64.zip"
    if [ -e iron-mac64.zip ]; then
        echo "📦  パッケージを解凍しています..."
        unzip iron-mac64.zip >> /dev/null
        echo "⬇️  アプリケーションをインストールしています..."
        cp -r ./iron-mac64/Chromium.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "🧹  クリーンアップしています..."
    rm -f iron-mac64.zip
    rm -rf ./iron-mac64/
}

uninstall() {
    cd /Applications/
    
    echo "🗑  Removing application..."
    rm -rf Chromium.app

    echo "🗑  Removing remaining files..."
    rm -rf ~/Library/Application\ Support/Chromium
    rm -rf ~/Library/Caches/Chromium
    rm -rf ~/Library/Preferences/org.chromium.Chromium.plist

    echo "🗑  Clearing saved state..."
    rm -rf ~/Library/Saved\ Application\ State/org.chromium.Chromium.savedState
}

update() {
    echo "NOW UNDER CONSTRUCTION!"
}

main() {
    install
}
