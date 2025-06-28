#!/usr/bin/env bash

if ! systemctl -q is-active NetworkManager.service && \
  command -v nm-applet >/dev/null 2>&1; then
    nm-applet &
fi

