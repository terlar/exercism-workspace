#!/usr/bin/env bash

usage() {
    echo "Usage: ${0##*/} <person>"
    exit 1
}

main() {
    [[ "$#" -eq 1 ]] || usage
    echo "Hello, $1"
}

main "$@"
