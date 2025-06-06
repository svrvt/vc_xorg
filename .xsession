#!/bin/sh

echo load .xsession $0

default_session="awesome"

userresources="$HOME/.config/X11/Xresources"
usermodmap="$HOME/.config/X11/Xmodmap"
if [ -f "$userresources" ]; then xrdb -merge "$userresources"; fi
if [ -f "$usermodmap" ]; then xmodmap "$usermodmap"; fi

set -e
USERXSESSIONDIR="$HOME/.config/X11/xsession.d"
SESSIONFILES="$(run-parts --list "$USERXSESSIONDIR")"
if [ -n "$SESSIONFILES" ]; then
        set +e
	for SESSIONFILE in $SESSIONFILES; do
		. "$SESSIONFILE"
	done
        set -e
fi
USERXSESSION_LOADED="true"

USERXINITRC="$HOME/.xinitrc"
if [ "$USERXINITRC_LOADED" != "true" ]; then
	[ -f "$USERXINITRC" ] && . "$USERXINITRC"
fi

exit 0

# vim:set ai et sts=2 sw=2 tw=80:
