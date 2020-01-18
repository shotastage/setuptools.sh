#!/usr/bin/env bash

uptask() {
    read -p "React Project Name: " prj
    npx create-react-app $prj
}
