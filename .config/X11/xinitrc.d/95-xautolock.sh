#!/usr/bin/env bash

LOCKER=physlock
if command -v xautolock >/dev/null 2>&1 && command -v $LOCKER >/dev/null 2>&1; then
    xautolock -time 15 -locker $LOCKER -notify 30 -notifier "notify-send -u critical -t 10000 -a $0 -- 'Locking screen in 30s'" &
fi
