#!/usr/bin/env bash

if command -v picom >/dev/null 2>&1; then
   if picom -h | grep -q '\-\-animations'; then
      picom --animations --daemon --config ~/.config/picom/picom.conf &
   else
      picom --daemon --config ~/.config/picom/picom.conf &
   fi
fi
