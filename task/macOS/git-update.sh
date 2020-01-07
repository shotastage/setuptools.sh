#!/usr/bin/env bash

uptask() {
    git add .
    read msg -p "Commit message: "
    git commit -m $msg
    git push -u origin master
}
