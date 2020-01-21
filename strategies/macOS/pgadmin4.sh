#!/usr/bin/env bash

STRATEGY_VERSION="v001"

. ~/.setuptools/lib/network.sh


install() {
    if [ -e /Applications/pgAdmin\ 4.app ]; then
        echo "🖥  pgAdminはすでにインストールされています."
        return
    fi
    echo "⬇️  pgAdminをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    download "https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v4.17/macos/pgadmin4-4.17.dmg" pgadmin4-4.17.dmg
    if [ -e pgadmin4-4.17.dmg ]; then
        echo "💿  イメージをマウントしています..."
        hdiutil mount pgadmin4-4.17.dmg >> /dev/null
        echo "⬇️  アプリケーションをインストールしています..."
        cp -r /Volumes/pgAdmin\ 4/pgAdmin\ 4.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "💿  イメージをアンマウントしています..."
    umount /Volumes/pgAdmin\ 4/ >> /dev/null
    echo "🧹  クリーンアップしています..."
    rm pgadmin4-4.17.dmg
}


uninstall() {
    cd /Applications/
    echo "🧹 Removing application..."
    rm -rf pgAdmin\ 4.app
    echo "🧹 Removing remaining files..."
    echo "🧹 Postgres has been uninstalled!"
}


update() {
    echo "Please update manually in pgAdmin 4.app menu."   
}

main() {
    install
}
