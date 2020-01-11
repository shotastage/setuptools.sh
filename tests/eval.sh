#!/usr/bin/env bash

CMD="brew update"


exec() {
    result="$(IFS=" "; echo "${CMD[*]}")"
    echo $result

    eval $1
}

exec $CMD
