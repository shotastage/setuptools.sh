#!/usr/bin/env bash

STRATEGY_VERSION="v001"


function install {
    if [ -e /Applications/iTerm.app ]; then
        echo "🖥  iTermはすでにインストールされています."
        return
    fi
    echo "⬇️  iTermをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://iterm2.com/downloads/stable/iTerm2-3_3_7.zip"
    if [ -e iTerm2-3_3_7.zip ]; then
        echo "📦  パッケージを展開しています..."
        unzip iTerm2-3_3_7.zip >> /dev/null
        mv iTerm.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "🧹  クリーンアップしています..."
    rm iTerm2-3_3_7.zip
}


function uninstall {
    cd /Applications/
    echo "🧹 Removing application..."
    rm -rf iTerm.app
    echo "🧹 Removing remaining files..."
    # rm -rf ~/Library/Application\ Support/Firefox/
    # rm -rf ~/Library/Caches/Firefox/
    # rm -f ~/Library/Preferences/org.mozilla.firefox.plist
    echo "🧹 iTerm has been uninstalled!"
}


function update {
    echo "NOW UNDER CONSTRUCTION."
}

function main {
    install
}
