#!/usr/bin/env bash

if command -v udiskie >/dev/null 2>&1; then
    udiskie --smart-tray --no-automount --file-manager "$TERMINAL -e ${FILE:-ranger}" &
fi

