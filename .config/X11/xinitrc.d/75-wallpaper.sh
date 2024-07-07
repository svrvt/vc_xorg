#!/usr/bin/env bash

if [ -d ~/.config/awesome/themes/wallpaper/still ]; then

  wallpaper_dir=$HOME/.config/awesome/themes/wallpaper/still

  if command -v feh >/dev/null 2>&1; then
    feh --bg-fill --randomize "$wallpaper_dir" &
  elif comman -v nitrogen >/dev/null 2>&1; then
    nitrogen --set-scaled --random "$wallpaper_dir" &
  fi
fi

