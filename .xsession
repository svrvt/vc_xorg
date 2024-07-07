#!/usr/bin/env bash

USERXSESSIONDIR=$HOME/.config/X11/xsession.d
SESSIONFILES=$(run-parts --list "$USERXSESSIONDIR")

default_session="awesome"

if [ -n "$SESSIONFILES" ]; then
	set +e
	for SESSIONFILE in $SESSIONFILES; do
		. "$SESSIONFILE"
	done
	set -e
fi
