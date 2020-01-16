#!/usr/bin/env bash

uptask() {
    
    dir_path="~/*"
    dirs=`find $dir_path -maxdepth 0 -type d`

    for dir in $dirs;
    do
        echo $dir
    done
}
