#!/usr/bin/env bash


function uptask() {
    if [ -e ./Upfile ]; then
        echo "📄  Upfile already exists!"
        exit 1
    fi

    echo "📄 Creating upfile..."
    touch Upfile

    echo "🖊  Writing contents..."
    echo "########## Upfile ##########" >> ./Upfile
    echo "declare -a strategies=(\"\" )"
}
