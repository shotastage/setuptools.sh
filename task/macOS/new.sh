#!/usr/bin/env bash


uptask() {
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

prj_template() {
    echo "Please choose project template."
}


front_menu() {
    echo "[1] Server-side or Backend Services"
    echo "[2] Web front-end program"
    echo "[3] Desktop App"
    echo "[4] Mobile or Smartphone Application"
    echo "[5] Others"
}

server_menu() {
    echo "[1] Go Backend Service"
    echo "[2] Go Backend Service + Microservice"
    echo "[3] Django Project"
    echo "[4] Ruby on Rails Project"
}

web_menu() {
    echo "[1] React.js Project"
    echo "[2] Vue.js Project"
    echo "[3] Angular Project"
    echo "[4] WordPress Theme"
}

desktop_menu() {
    echo "[1] Electron App"
    echo "[2] macOS Application"
    echo "[3] Win32 Application"
}