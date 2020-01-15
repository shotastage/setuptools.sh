#!/usr/bin/env bash

uptask() {
    openssl genpkey -algorithm RSA \
        -pkeyopt rsa_keygen_bits:4094 \
        -pkeyopt rsa_keygen_pubexp:65537 | \
        openssl pkcs8 -topk8 -nocrypt -outform der > rsa-private-key.p8
}
