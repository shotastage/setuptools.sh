#!/usr/bin/env bash


. $HOME/.setuptools/lib/platform.sh


list_tasks() {
    echo "Cached tasks:"
    echo
    for fname in $HOME/.setuptools/tasks/*.sh; do
        basename $fname .sh
    done
}

show_task_script() {
    # Check task directory preparation
    if [ ! -e $WORKING_DIRECTORY/tasks/ ]; then
        mkdir $WORKING_DIRECTORY/tasks/
    fi

    # Download script
    echo "Downloading ${1} ..."
    curl --silent "${TASK_MASTER_URL}/${1}.sh" -o $WORKING_DIRECTORY/tasks/${1}.sh
    chmod +x $WORKING_DIRECTORY/tasks/${1}.sh
    # verify_taskscript ${1}.sh "https://raw.githubusercontent.com/shotastage/setuptools.sh/master/task/$(operating_system)/signatures/${1}.sh.sig"

    echo
    cat $WORKING_DIRECTORY/tasks/${1}.sh
}
