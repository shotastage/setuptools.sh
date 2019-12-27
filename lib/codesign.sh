#!/usr/bin/env bash


sign_master() {
    for fname in ./strategies/macOS/*.sh; do
        echo "🔑  Signinig ${fname} ..."
        gpg --batch --yes -u 86133173EF57B60825297D8C374773E889C0E769 -b $fname
    done
}
