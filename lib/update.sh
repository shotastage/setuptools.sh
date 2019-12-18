#!/usr/bin/env bash

. $HOME/.setuptools/config/master

function check_update {
    COMMIT_ID=`git ls-remote origin HEAD | sed -e 's/HEAD//g'`
}
