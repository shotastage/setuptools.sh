#!/usr/bin/env bash


function uptask() {
    echo "Project name:"
    read pjname
    mkdir $pjname
    cd $pjname
    git init
    echo "${pjname}" >> README.md
    echo "==========" >> README.md
    echo "Project description is here"
}
