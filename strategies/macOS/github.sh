#!/usr/bin/env bash

STRATEGY_VERSION="v001"

. ~/.setuptools/lib/foundation.sh

function install {
    if [ -e /Applications/Github\ Desktop.app/ ]; then
        echo "🖥  Githubはすでにインストールされています."
        return
    fi
    echo "⬇️  Githubをインストールします."
    echo "⬇️  ファイルをダウンロードしています..."
    curl -OL "https://desktop.githubusercontent.com/releases/2.2.4-be951a19/GitHubDesktop.zip"
    if [ -e GitHubDesktop.zip ]; then
        echo "💿  イメージをマウントしています..."
        unzip GitHubDesktop.zip >> /dev/null
        echo "⬇️  アプリケーションをインストールしています..."
        cp -r Github\ Desktop.app /Applications/
    else
        echo "⚠️ パッケージのダウンロードに失敗しました！"
        echo "スクリプトを終了します [ Press Return to continue]"
        read
        exit 1
    fi

    echo "🧹  クリーンアップしています..."
    rm GitHubDesktop.zip
}

function uninstall {
    cd /Applications/
    rm -rf Github\ Desktop.app
}

function update {
    echo "NOW UNDER CONSTRUCTION!"
}

function main {
    install
}
