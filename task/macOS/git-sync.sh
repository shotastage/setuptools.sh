#!/usr/bin/env bash

uptask() {
    git fetch origin && git remote prune origin
}

splash() {
    echo "Uptool Git Utils Beta"
    echo ""
}
