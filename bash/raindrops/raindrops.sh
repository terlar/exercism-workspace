#!/usr/bin/env bash

main() {
    declare sound
    n="$1"

    ((x = "$n" / 3, f3 = x * 3))
    ((x = "$n" / 5, f5 = x * 5))
    ((x = "$n" / 7, f7 = x * 7))

    case "$n" in
    "$f3" | "$f5" | "$f7")
        [[ "$f3" = "$n" ]] && sound+=Pling
        [[ "$f5" = "$n" ]] && sound+=Plang
        [[ "$f7" = "$n" ]] && sound+=Plong
        ;;
    *) sound="$n" ;;
    esac

    echo "$sound"
}

main "$@"
