#!/usr/bin/env bash

curl --silent https://raw.githubusercontent.com/shotastage/setuptools.sh/master/task/macOS/git-update.sh -o git-update.sh
curl --silent https://raw.githubusercontent.com/shotastage/setuptools.sh/master/task/macOS/signatures/git-update.sh.sig -o git-update.sh.sig
chmod +x git-update.sh

gpg --quiet --verify git-update.sh.sig git-update.sh

rm -f  git-update.sh.sig git-update.sh
