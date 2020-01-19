#!/usr/bin/env bash

STRATEGY_VERSION="v001"

. ~/.setuptools/lib/foundation.sh

install() {
    if [ -e /Applications/Typora.app/ ]; then
        echo "🖥  Typoraはすでにインストールされています."
        return
    fi
    echo "⬇️  Typoraをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://www.typora.io/download/Typora.dmg"
    if [ -e Typora.dmg ]; then
        echo "💿  イメージをマウントしています..."
        dmg Typora.dmg
        echo "⬇️  アプリケーションをインストールしています..."
        cp -r /Volumes/Typora/Typora.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "💿  イメージをアンマウントしています..."
    defer_dmg "Typora"
    echo "🧹  クリーンアップしています..."
    rm Typora.dmg
}

uninstall() {
    cd /Applications/
    rm -rf Typora.app
}

update() {
    echo "NOW UNDER CONSTRUCTION!"
}

main() {
    install
}
