#!/usr/bin/env bash

STRATEGY_VERSION="v001"

. ~/.setuptools/lib/foundation.sh
. ~/.setuptools/lib/use_homebrew.sh

install() {
    if [ -e /Applications/Discord.app/ ]; then
        echo "🖥  Discordはすでにインストールされています."
        return
    fi

    use_homebrew
    brew install --cask discord
}

uninstall() {
    echo "🗑  アプリケーションを削除しています..."
    use_homebrew
    brew uninstall discord

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

update() {
    echo "🔄  To upgrade Discord app, please open app and then"
    open -a Discord.app
}

open() {
    open -a Discord.app 
}

main() {
    install
}
