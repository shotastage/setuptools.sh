#!/usr/bin/env bash


function uptask() {
    echo "Project name:"
    read pjname
    echo "Description:"
    read pjdesc
    mkdir $pjname
    cd $pjname
    git init
    echo "${pjname}" >> README.md
    echo "==========" >> README.md
    echo $pjdesc >> README.md
    uptool t create-upfile
}
