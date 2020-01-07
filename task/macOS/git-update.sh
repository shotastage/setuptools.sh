#!/usr/bin/env bash

uptask() {

    git add .
    read -p "Commit message: " msg
    git commit -m $msg
    git push -u origin master
}
