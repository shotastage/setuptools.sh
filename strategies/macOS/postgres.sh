#!/usr/bin/env bash

STRATEGY_VERSION="v001"

. ~/.setuptools/lib/network.sh


install() {
    if [ -e /Applications/Postgres.app ]; then
        echo "🖥  Postgresはすでにインストールされています."
        return
    fi
    echo "⬇️  Postgresをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    download "https://github.com/PostgresApp/PostgresApp/releases/download/v2.3.3c/Postgres-2.3.3c-12.dmg" Postgres-2.3.3c-12.dmg
    if [ -e Postgres-2.3.3c-12.dmg ]; then
        echo "💿  イメージをマウントしています..."
        hdiutil mount Postgres-2.3.3c-12.dmg >> /dev/null
        echo "⬇️  アプリケーションをインストールしています..."
        cp -r /Volumes/Postgres-2.3.3c-12/Postgres.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "💿  イメージをアンマウントしています..."
    umount /Volumes/Postgres-2.3.3c-12/ >> /dev/null
    echo "🧹  クリーンアップしています..."
    rm Postgres-2.3.3c-12.dmg
}


uninstall() {
    cd /Applications/
    echo "🧹 Removing application..."
    rm -rf Postgres.app
    echo "🧹 Removing remaining files..."
    echo "🧹 Postgres has been uninstalled!"
}


update() {
    echo "Please update manually in Postgres.app menu."
    open -a Postgres.app
}

main() {
    install
}
