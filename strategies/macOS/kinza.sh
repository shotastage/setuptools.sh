#!/usr/bin/env bash

STRATEGY_VERSION="v001"

. ~/.setuptools/lib/foundation.sh

install() {
    if [ -e /Applications/Kinza.app/ ]; then
        echo "🖥  Kinzaはすでにインストールされています."
        return
    fi
    echo "⬇️  Kinzaをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://d7s9ygw7nxr46.cloudfront.net/mac/kinza_5.0.1.dmg"
    if [ -e kinza_5.0.1.dmg ]; then
        echo "💿  イメージをマウントしています..."
        dmg kinza_5.0.1.dmg
        echo "⬇️  アプリケーションをインストールしています..."
        cp -r /Volumes/Kinza/Kinza.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "💿  イメージをアンマウントしています..."
    defer_dmg "Kinza"
    echo "🧹  クリーンアップしています..."
    rm kinza_5.0.1.dmg
}

uninstall() {
    cd /Applications/

    echo "🗑  Removing application..."
    rm -rf Kinza.app
    echo "🗑  Removing remaining files..."
    rm -rf ~/Library/Application Support/Kinza
    echo "🗑  Clearing cache..."
    rm -rf ~/Library/Caches/Kinza
    rm -rf ~/Library/Preferences/jp.kinza.Kinza.plist
    echo "🗑  Removing saved state..."
    rm -rf ~/Library/Saved Application State/jp.kinza.Kinza.savedState
}

update() {
    echo "NOW UNDER CONSTRUCTION!"
}

main() {
    install
}
