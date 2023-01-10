#!/usr/bin/env bash

usage() {
    echo "Usage: ${0##*/} <int>"
    exit 1
}

main() {
    n="$1"

    [[ "$#" -eq 1 ]] || usage
    [[ "$n" =~ ^[0-9]*$ ]] || usage

    declare sound
    ((n % 3 == 0)) && sound+=Pling
    ((n % 5 == 0)) && sound+=Plang
    ((n % 7 == 0)) && sound+=Plong

    echo "${sound:-$n}"
}

main "$@"
