#!/usr/bin/env bash


verify_script() {
    echo "🔑  Verifying script..."

    curl --silent -O $2 >> /dev/null

    echo "sddqwoqwijdiqwdjoqwdiqwojdiqwoa"
       
    LANG=C LC_MESSAGES=C gpg --verify $1.sig $1 2>&1 | grep WARNING > /dev/null
    if [[ "${PIPESTATUS[0]} ${PIPESTATUS[1]}" == "0 1" ]]; then
        echo "AAAAA"
    else
        echo "❌  Bad signature! "
        exit 1
    fi
}
