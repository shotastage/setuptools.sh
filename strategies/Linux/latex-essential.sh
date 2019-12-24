#!/usr/bin/env bash

STRATEGY_VERSION="v001"


install() {
    uptool i vscode
    uptool i latex
}

uninstall() {
    uptool uninstall vscode
    uptool uninstall latex
}

update() {
    uptool u vscode
    uptool u latex
}
