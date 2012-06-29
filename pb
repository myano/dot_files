#!/usr/bin/env bash

if [ -f /usr/lib/libtsocks.so ]; then
    export LD_PRELOAD=/usr/lib/libtsocks.so
fi

pianobar
