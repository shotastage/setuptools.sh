#!/usr/bin/env bash

uptask() {
    read -p "Module Name: " mname
    mkdir $mname
    touch $mname/__init__.py
    echo "module ${mname} has been created."
    echo "To import this module:"
    echo
    echo "import * from ${mname}"
    echo
}
