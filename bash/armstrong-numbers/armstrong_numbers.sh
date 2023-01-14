#!/usr/bin/env bash

echoerr() {
    printf "%s\n" "$*" >&2
}

usage() {
    echoerr "Usage: ${0##*/} <number>"
    exit 1
}

main() {
    [[ "$#" -eq 1 ]] || usage
    [[ "$1" =~ ^[0-9]*$ ]] || usage

    declare -i sum=0

    number="$1"
    num_of_digits="${#1}"

    for ((i = 0; i < "$num_of_digits"; i++)); do
        digit="${1:$i:1}"
        sum+=$((digit ** num_of_digits))
        ((sum > number)) && break
    done

    if ((number == sum)); then
        echo "true"
    else
        echo "false"
    fi
}

main "$@"
