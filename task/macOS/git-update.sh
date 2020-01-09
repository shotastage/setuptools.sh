#!/usr/bin/env bash

uptask() {

    splash

    git add .
    read -p "Commit message: " msg
    git commit -m $msg
    git push -u origin master
}

splash() {
    echo "Uptool Git Utils Beta"
    echo ""
}
