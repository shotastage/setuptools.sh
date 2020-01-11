#!/usr/bin/env bash

WORKING_DIRECTORY=~/.setuptools


splash() {
    echo
}

. $WORKING_DIRECTORY/lib/workspace.sh
. $WORKING_DIRECTORY/lib/executor.sh
. $WORKING_DIRECTORY/lib/strategies.sh
. $WORKING_DIRECTORY/lib/tasks.sh
. $WORKING_DIRECTORY/lib/configure.sh
. $WORKING_DIRECTORY/lib/masterdev.sh



splash 
initialize
prepare_workspace



for OPT in "$@"
do
    case $OPT in
        i | install | add )
            execute install $2
            exit 0
            ;;
        u | update )
            if [ ${2} = "self" ]; then
                uptool-update
                exit 0
            fi

            execute update $2
            exit 0
            ;;
        s | search )
            search_strategy $2
            exit 0
            ;;
        t | task )
            exetask $2
            exit 0
            ;;
        uninstall | remove )
            execute uninstall $2
            exit 0
            ;;
        cfg | configure )
            echo "🔄  Generating configuration..."
            configure
            exit 0
            ;;
        h | help )
            setuptools-help
            exit 0
            ;;
        v | version )
            echo
            echo "setuptools 1.1.0"
            echo "Copyright (C) 2019 Shota Shimazu, All rights reserved."
            echo 
            exit 0
            ;;
        --show-user-log )
            cat $WORKING_DIRECTORY/exec_user_log
            exit 0
            ;;
        --show-cached-strategies )
            list_strategies
            exit 0
            ;;
        --clear-strategies )
            clear_strategies
            exit 0
            ;;

        --show-cached-tasks )
            list_tasks
            exit 0
            ;;
        --clear-tasks )
            clear_tasks
            exit 0
            ;;
        --dev-master )
            echo "Plase type master development command:"
            while true
            do
                read -p "Uptool [Dev Master] >>> " master_dev_cmd
                master_cmd $master_dev_cmd

                if [ $master_dev_cmd = "exit" ]; then
                    break
                fi
            done
            exit 0
            ;;
    esac
done
