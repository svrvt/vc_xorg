#!/usr/bin/env bash

if command -v copyq >/dev/null 2>&1; then
    copyq --start-server &
elif command -v greenclip >/dev/null 2>&1; then
    greenclip daemon &
fi

