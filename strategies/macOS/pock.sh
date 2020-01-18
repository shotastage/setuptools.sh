#!/usr/bin/env bash

STRATEGY_VERSION="v001"

install() {
    if [ -e /Applications/Pock.app ]; then
        echo "🪁  Pockはすでにインストールされています."
        return
    fi
    echo "⬇️  Kitematicをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -sLJO "https://pock.dev/download.php?file=pock_0_7_2.zip"
    if [ -e pock_0_7_2.zip ]; then
        echo "📦  パッケージを展開しています..."
        unzip pock_0_7_2.zip >> /dev/null
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi
       
    echo "⬇️  アプリケーションをインストールしています..."
    mv Pock.app/ /Applications/
    echo "🧹  クリーンアップしています..."
    rm pock_0_7_2.zip
}

uninstall() {
    cd /Applications/
    rm -rf Pock.app
    echo "🧹 Pock has been uninstalled!"
}

update() {
    echo "NOW UNDER CONSTRUCTION."
}

main() {
    install
}
