#!/usr/bin/env bash

CMD="brew update"


exec() {
    #result="$(IFS=" "; echo "${@[*]}")"
    #echo $result

    eval $@
}

exec $CMD
