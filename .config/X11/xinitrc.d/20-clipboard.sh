#!/usr/bin/env bash

if command -v greenclip >/dev/null 2>&1; then
    greenclip daemon &
fi

