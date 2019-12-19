#!/usr/bin/env bash

STRATEGY_VERSION="v001"

function install {
    echo "Linux Homebrew strategy is aviable as linuxbrew."
    echo "Please run uptool i linuxbrew."
}

function uninstall {
    echo "To uninstall Linux Homebrew, please run uptool uninstall linuxbrew."
}

function update {
    echo "Warning: Linux Homebrew strategy is aviable as linuxbrew."
    brew update
}
