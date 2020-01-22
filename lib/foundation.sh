#!/usr/bin/env bash

dmg() {
    hdiutil mount ${1} >> /dev/null
    return 0
}

defer_dmg() {
    umount /Volumes/${1}/ >> /dev/null
    return 0
}

end_script() {
    echo
    echo "To run this script, please install uptool."
    echo
    echo "ex: "
    echo "uptool i/u/uninstall/ `basename $0 | tr -d ".sh"`"    
    echo
}
