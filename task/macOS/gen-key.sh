#!/usr/bin/env bash

uptask() {
    openssl genpkey -algorithm RSA >> privkey.rsa
}
