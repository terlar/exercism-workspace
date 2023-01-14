#!/usr/bin/env bash

echoerr() {
    printf "%s\n" "$*" >&2
}

usage() {
    echoerr "Usage: ${0##*/} <string>"
    exit 1
}

main() {
    [[ "$#" -eq 1 ]] || usage

    set -f
    declare acronym
    words="${1//-/ }"
    words="${words//[^ [:alpha:]]/}"

    for word in $words; do
        acronym+="${word:0:1}"
    done

    echo "${acronym^^}"
}

main "$@"
