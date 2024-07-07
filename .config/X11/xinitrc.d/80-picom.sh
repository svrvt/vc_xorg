#!/usr/bin/env bash

if command -v picom >/dev/null 2>&1; then
   picom --daemon --config ~/.config/picom/picom.conf &
fi

