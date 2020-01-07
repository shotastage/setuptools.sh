#!/usr/bin/env bash


master_cmd() {
    if [ ${1} = "sign-master" ]; then
        sign_master
    fi
}

sign_master() {
    for fname in ./strategies/**/*.sh; do
        echo "🔑  Signinig strategy ${fname} ..."

        gpg --quiet --verify $(dirname ${fname})/signatures/$(basename ${fname}).sig $fname 2>/dev/null

        if [ $? -eq 0 ]; then
            echo "🔑  $fname is already verifeid."
        else
            gpg --batch --yes -u 86133173EF57B60825297D8C374773E889C0E769 -b $fname
        fi
    done

    for fname in ./task/**/*.sh; do
        echo "🔑  Signinig strategy ${fname} ..."

        gpg --quiet --verify $(dirname ${fname})/signatures/$(basename ${fname}).sig $fname 2>/dev/null

        if [ $? -eq 0 ]; then
            echo "🔑  $fname is already verifeid."
        else
            gpg --batch --yes -u 86133173EF57B60825297D8C374773E889C0E769 -b $fname
        fi
    done

    for fname in ./strategies/macOS/*.sh; do
        echo "🔑  Indexing macOS strategy signature ${fname} ..."
        if [ -e $fname.sig ]; then
            mv $fname.sig ./strategies/macOS/signatures/
        fi
    done

    for fname in ./task/macOS/*.sh; do
        echo "🔑  Indexing macOS task signature ${fname} ..."

        if [ -e $fname.sig ]; then
            mv $fname.sig ./task/macOS/signatures/
        fi
    done

    for fname in ./strategies/Linux/*.sh; do
        echo "🔑  Indexing Linux strategy signature ${fname} ..."
        if [ -e $fname.sig ]; then
            mv $fname.sig ./strategies/Linux/signatures/
        fi
    done

    for fname in ./task/Linux/*.sh; do
        echo "🔑  Indexing Linux task signature ${fname} ..."
        if [ -e $fname.sig ]; then
            mv $fname.sig ./task/Linux/signatures/
        fi
    done
}


clear_sign_master() {
    echo "None"
}