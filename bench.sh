#!/bin/bash
set -euo pipefail

ITERATIONS=100
DELAY="0.08s"
# Number of worst values to not count in the average
THROWAWAY=8

function bench {
    cd $1;
    results=();
    for (( i=0; i<ITERATIONS; i++ ))
    do
        results+=($($2 | rg "$3" -o -r '$1'))
        sleep $DELAY
    done

    IFS=$'\n' sorted=($(sort -n <<<"${results[*]}"))
    unset IFS

    middle=$(echo "scale=0; $ITERATIONS / 2" | bc -l)
    median=${sorted[$middle]}
    better=(${sorted[@]:-$THROWAWAY})

    mean="0"
    for r in "${better[@]}"
    do
        mean=$(echo "$mean + $r" | bc -l)
    done
    mean=$(echo "scale=5; $mean / ($ITERATIONS - $THROWAWAY)" | bc -l)

    rms="0"
    for r in "${better[@]}"
    do
        rms=$(echo "$rms + ($mean - $r)^2" | bc -l)
    done
    rms=$(echo "scale=5; sqrt($rms / ($ITERATIONS - $THROWAWAY))" | bc -l)

    echo "$1: $mean ms (±$rms), median = $median ms"
    cd ..;
}

bench blades blades "Done in (.*)ms"
bench zola "zola build" "Done in (.*)ms"
bench hugo hugo "Total in (.*) ms"
