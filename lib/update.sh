#!/usr/bin/env bash

if [ -e . $HOME/.setuptools/config/master ]; then
    . $HOME/.setuptools/config/master
fi

function check_update {
    COMMIT_ID=`git ls-remote origin HEAD | sed -e 's/HEAD//g'`
}
