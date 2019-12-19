#!/usr/bin/env bash

dmg() {
    hdiutil mount ${1} >> /dev/null
    return 0
}

defer_dmg() {
    umount /Volumes/${1}/ >> /dev/null
    return 0
}
