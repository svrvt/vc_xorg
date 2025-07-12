#!/usr/bin/env bash

#setxkbmap -model pc104 -layout us,ru -option grp:shifts_toggle &

xkb_option=(\
  'grp:toggle' \
  'grp:rctrl_switch' \
  'grp_led:caps ' \
)

# if localectl list-x11-keymap-options | grep -q 'caps:tmux_prefix'; then
# 	xkb_option=("${xkb_option[@]}" 'caps:tmux_prefix')
# fi

option_part=()

for o in "${xkb_option[@]}"; do
	option_part+=(-option "$o" )
done

setxkbmap "${option_part[@]}" -layout us,ru &
