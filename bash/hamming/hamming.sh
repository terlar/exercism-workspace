#!/usr/bin/env bash

echoerr() {
    printf "%s\n" "$*" >&2
}

usage() {
    echoerr "Usage: ${0##*/} <string1> <string2>"
    exit 1
}

main() {
    [[ "$#" -eq 2 ]] || usage
    if [[ "${#1}" != "${#2}" ]]; then
        echoerr strands must be of equal length >&2
        exit 1
    fi

    declare -i diff=0

    for ((i = 0; i < "${#1}"; i++)); do
        [[ "${1:$i:1}" != "${2:$i:1}" ]] && ((diff++))
    done

    echo $diff
}

main "$@"
