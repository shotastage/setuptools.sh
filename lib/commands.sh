#!/usr/bin/env bash


. ~/.setuptools/lib/masterdev.sh


cliarg() {
    for OPT in "$@"
    do
        case $OPT in
            exit )
                echo "Terminating session..."
                return
                ;;
            baxk )
                cd ..
                return
                ;;
            signall )
                sign_master
                return
                ;;
                
        esac
    done

    if type $1 > /dev/null 2>&1; then
        eval $@
    else
        echo "This command does not exist!"
    fi
}
