#!/usr/bin/env bash

uptask() {
    openssl genpkey -algorithm RSA \
        -pkeyopt rsa_keygen_bits:4094 \
        -pkeyopt rsa_keygen_pubexp:65537 >> rsa-private-key.p8
}
