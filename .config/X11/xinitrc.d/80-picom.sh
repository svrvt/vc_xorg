#!/usr/bin/env bash

if command -v picom >/dev/null 2>&1; then
   if command -v nvidia-smi >/dev/null 2>&1; then
      tm=$(nvidia-smi --query-gpu=memory.total --format=csv | grep -v memory | awk '{print $1}')
      if picom -h | grep -q '\-\-animations' && [[ $tm -ge 2048 ]]; then
         picom --animations --daemon --config ~/.config/picom/picom.conf &
      else
         picom --daemon --config ~/.config/picom/picom.conf &
      fi
   #else
   #   picom --daemon --config ~/.config/picom/picom.conf &
   fi
fi
