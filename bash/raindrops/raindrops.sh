#!/usr/bin/env bash

main() {
    n="$1"

    declare sound

    [[ $((n % 3)) -eq 0 ]] && sound+=Pling
    [[ $((n % 5)) -eq 0 ]] && sound+=Plang
    [[ $((n % 7)) -eq 0 ]] && sound+=Plong
    [[ -z "$sound" ]] && sound="$n"

    echo "$sound"
}

main "$@"
