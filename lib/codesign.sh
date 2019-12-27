#!/usr/bin/env bash


sign_master() {
    for fname in ./strategies/**/*.sh; do
        echo "🔑  Signinig strategy ${fname} ..."
        gpg --batch --yes -u 86133173EF57B60825297D8C374773E889C0E769 -b $fname

        if [ `$fname | grep macOS` ]; then
            mv $fname ./strategies/macOS/signatures/
        fi

        if [ `$fname | grep Linux` ]; then
            mv $fname ./strategies/Linux/signatures/
        fi
    done

    for fname in ./task/**/*.sh; do
        echo "🔑  Signinig task ${fname} ..."
        gpg --batch --yes -u 86133173EF57B60825297D8C374773E889C0E769 -b $fname
    done
}
