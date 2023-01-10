#!/usr/bin/env bash

usage() {
    cmd="$(basename "$0")"
    echo "Usage: $cmd <person>"
}

main() {
    if [[ "$#" -ne 1 ]]; then
        usage
        exit 1
    fi

    echo "Hello, $1"
}

main "$@"
