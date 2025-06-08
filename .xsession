#!/bin/sh
echo load .xsession $0
env >~/.local/share/xorg/"xinitrc_env.${DISPLAY#:}.log" 2>&1
set -e

default_session="awesome"
USERXSESSIONDIR="$HOME/.config/X11/xsession.d"
SESSIONFILES="$(run-parts --list "$USERXSESSIONDIR")"
USERXINITRC="$HOME/.xinitrc"
userresources="$HOME/.config/X11/Xresources"
usermodmap="$HOME/.config/X11/Xmodmap"

[ "$0" != "$USERXINITRC" ] && [ -f "$USERXINITRC" ] && . "$USERXINITRC"

if [ -f "$userresources" ]; then xrdb -merge "$userresources"; fi
if [ -f "$usermodmap" ]; then xmodmap "$usermodmap"; fi

if [ -n "$SESSIONFILES" ]; then
  set +e
	for SESSIONFILE in $SESSIONFILES; do
		. "$SESSIONFILE"
	done
  set -e
fi

#exit 0

# vim:set ai et sts=2 sw=2 tw=80:
