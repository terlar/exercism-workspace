#!/usr/bin/env bash

echoerr() {
    printf "%s\n" "$*" >&2
}

usage() {
    echoerr "Usage: ${0##*/} <string1> <string2>"
    exit 1
}

main() {
    set -f
    declare acronym

    for word in ${1//[-]/ }; do
        word="${word//[^[:alpha:]]/}"
        [[ -n "$word" ]] && acronym+="${word:0:1}"
    done

    echo "${acronym^^}"
}

main "$@"
