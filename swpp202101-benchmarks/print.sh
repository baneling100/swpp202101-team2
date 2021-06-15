#!/bin/bash

for pathname in *; do
    if [ -d $pathname ]; then
        cd "$pathname/test"
        for inputname in *.txt.log; do
            x=$(cat $inputname | grep Cost | cut -d " " -f2)
            y=$(cat $inputname | grep Max | cut -d ":" -f2)
            sum="$( bc <<<"$x + $y" )"
            echo -n "$sum "
        done
        echo ""
        cd ../../
    fi
done
