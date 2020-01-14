#!/usr/bin/env bash

STRATEGY_VERSION="v001"

. ~/.setuptools/lib/foundation.sh

install() {
    if [ -e /Applications/Discord.app/ ]; then
        echo "🖥  Discordはすでにインストールされています."
        return
    fi
    echo "⬇️  Discordをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://dl.discordapp.net/apps/osx/0.0.255/Discord.dmg"
    if [ -e Discord.dmg ]; then
        echo "💿  イメージをマウントしています..."
        dmg Discord.dmg
        echo "⬇️  アプリケーションをインストールしています..."
        cp -r /Volumes/Discord/Discord.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "💿  イメージをアンマウントしています..."
    defer_dmg "Discord"
    echo "🧹  クリーンアップしています..."
    rm Discord.dmg
}

function uninstall {
    echo "🗑  アプリケーションを削除しています..."
    cd /Applications/
    rm -rf Discord.app

    echo "🗑  残留ファイルを削除しています..."
    rm -rf ~/Library/Application Support/discord

    echo "🗑  キャッシュを削除しています..."
    rm -rf ~/Library/Caches/com.hnc.Discord
    rm -rf ~/Library/Caches/com.hnc.Discord.ShipIt

    echo "📄  ログをクリアしています..."
    rm -rf ~/Library/Logs/Discord

    echo "⚙️  設定を削除しています..."
    rm -rf ~/Library/Preferences/com.hnc.Discord.plist

    echo "🗑  状態を削除しています..."
    rm -rf ~/Library/Saved Application State/com.hnc.Discord.savedState
}

function update {
    echo "NOW UNDER CONSTRUCTION!"
}

function main {
    install
}
