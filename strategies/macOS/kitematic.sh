#!/usr/bin/env bash

STRATEGY_VERSION="v001"

install() {
    if [ -e /Applications/Kitematic.app ]; then
        echo "🪁  Kitematicはすでにインストールされています."
        return
    fi
    echo "⬇️  Kitematicをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -sLJO "https://github.com/docker/kitematic/releases/download/v0.17.10/Kitematic-0.17.10-Mac.zip"
    if [ -e Kitematic-0.17.10-Mac.zip ]; then
        echo "📦  パッケージを展開しています..."
        unzip Kitematic-0.17.10-Mac.zip >> /dev/null
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi
       
    echo "⬇️  アプリケーションをインストールしています..."
    mv Kitematic.app/ /Applications/
    echo "🧹  クリーンアップしています..."
    rm Kitematic-0.17.10-Mac.zip
}

uninstall() {
    cd /Applications/
    rm -rf Kitematic.app
    echo "🧹 Kitematic has been uninstalled!"
}

update() {
    echo "NOW UNDER CONSTRUCTION."
}

main() {
    install
}
