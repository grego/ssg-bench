#!/bin/bash
set -euo pipefail

ITERATIONS=100
DELAY="0.05s"

function bench {
    cd $1;
    results=();
    for (( i=0; i<ITERATIONS; i++ ))
    do
        results+=($($2 | rg "$3" -o -r '$1'))
        sleep $DELAY
    done

    mean="0"
    for r in "${results[@]}"
    do
        mean=$(echo "$mean + $r" | bc -l)
    done
    mean=$(echo "scale=5; $mean / $ITERATIONS" | bc -l)

    rms="0"
    for r in "${results[@]}"
    do
        rms=$(echo "$rms + ($mean - $r)^2" | bc -l)
    done
    rms=$(echo "scale=5; sqrt($rms / $ITERATIONS)" | bc -l)

    echo "$1: $mean ms (±$rms)"
    cd ..;
}

bench blades blades "Done in (.*)ms"
bench zola "zola build" "Done in (.*)ms"
bench hugo hugo "Total in (.*) ms"
