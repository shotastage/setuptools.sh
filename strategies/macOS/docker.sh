#!/usr/bin/env bash

. ~/.setuptools/lib/foundation.sh


STRATEGY_VERSION="v002"
PLATFORM="macOS"

DESCRIPTION=`cat << EOS
This is dummy strategy for macOS.
EOS
`

HELP=`cat << EOS
This is dummy strategy for macOS.
EOS
`

install() {
    if [ -e /Applications/Docker.app/ ]; then
        echo "🐳  Docker Desktopはすでにインストールされています."
        return
    fi
    echo "⬇️  Docker Desktopをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://download.docker.com/mac/stable/Docker.dmg"
    if [ -e Docker.dmg ]; then
        echo "💿  イメージをマウントしています..."
        dmg Docker.dmg
        echo "⬇️  アプリケーションをインストールしています..."
        cp -r /Volumes/Docker/Docker.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "💿  イメージをアンマウントしています..."
    defer_dmg "Docker"
    echo "🧹  クリーンアップしています..."
    rm Docker.dmg
}

uninstall() {
    echo "Now under construction..."
}

update() {
    echo "Now under construction..."
}
