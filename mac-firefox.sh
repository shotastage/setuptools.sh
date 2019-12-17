#!/usr/bin/env bash


function install {
    if [ -e /Applications/Firefox.app ]; then
        echo "🖥  Firefoxはすでにインストールされています."
        return
    fi
    echo "⬇️  Firefoxをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://download-installer.cdn.mozilla.net/pub/firefox/releases/71.0/mac/ja-JP-mac/Firefox%2071.0.dmg"
    if [ -e Firefox%2071.0.dmg ]; then
        mv Firefox%2071.0.dmg Firefox_2071.0.dmg
        echo "💿  イメージをマウントしています..."
        hdiutil mount Firefox_2071.0.dmg >> /dev/null
        echo "⬇️  アプリケーションをインストールしています..."
        cp -r /Volumes/Firefox/Firefox.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "💿  イメージをアンマウントしています..."
    umount /Volumes/Firefox/ >> /dev/null
    echo "🧹  クリーンアップしています..."
    rm Firefox_2071.0.dmg
}


function uninstall {
    cd /Applications/
    echo "🧹 Removing application..."
    rm -rf Firefox.app
    echo "🧹 Removing remaining files..."
    rm -rf ~/Library/Application\ Support/Firefox/
    rm -rf ~/Library/Caches/Firefox/
    rm -f ~/Library/Preferences/org.mozilla.firefox.plist
    echo "🧹 Firefox has been uninstalled!"
}


function main {
    install
}
