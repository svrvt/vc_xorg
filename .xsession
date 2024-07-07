#!/usr/bin/env bash

USERXSESSIONDIR=$HOME/.config/X11/xsession.d
SESSIONFILES=$(run-parts --list "$USERXSESSIONDIR")

USERXINITRC=$HOME/.xinitrc

if [ "$USERXSESSION_LOADED" = "true" ]; then
	return
fi
export USERXSESSION_LOADED=true

if [ "$USERXINITRC_LOADED" != "true" ]; then
	[ -f "$USERXINITRC" ] && . "$USERXINITRC"
fi

default_session="awesome"

if [ -n "$SESSIONFILES" ]; then
	set +e
	for SESSIONFILE in $SESSIONFILES; do
		. "$SESSIONFILE"
	done
	set -e
fi
