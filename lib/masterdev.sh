#!/usr/bin/env bash


master_cmd() {
    if [ ${1} = "sign-master" ]; then
        sign_master
    fi
}

sign_master() {
    for fname in ./strategies/**/*.sh; do
        echo "🔑  Signinig strategy ${fname} ..."
        gpg --batch --yes -u 86133173EF57B60825297D8C374773E889C0E769 -b $fname

        if [ `$fname | grep macOS` ]; then

            echo $fname.sig
            mv $fname.sig ./strategies/macOS/signatures/
        fi

        if [ `$fname | grep Linux` ]; then
            mv $fname.sig ./strategies/Linux/signatures/
        fi
    done

    for fname in ./task/**/*.sh; do
        echo "🔑  Signinig task ${fname} ..."
        gpg --batch --yes -u 86133173EF57B60825297D8C374773E889C0E769 -b $fname

        if [ `$fname | grep macOS` ]; then
            mv $fname.sig ./task/macOS/signatures/
        fi

        if [ `$fname | grep Linux` ]; then
            mv $fname.sig ./task/Linux/signatures/
        fi
    done
}


clear_sign_master() {
    echo "None"
}