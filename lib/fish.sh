#!/usr/bin/env bash


function generate_fish_script {
    touch fish_adding_script.fish
    echo "set -U fish_user_paths $1 \$fish_user_paths" >> fish_adding_script.fish
    chmod +x fish_adding_script.fish
}


function add_fish_path {
    generate_fish_script $1
    fish fish_adding_script.fish
}
