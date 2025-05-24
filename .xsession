#!/bin/bash

set -e

echo loaded 2 $0
USERXINITRC=$HOME/.xinitrc
USERXSESSIONDIR=$HOME/.config/X11/xsession.d
SESSIONFILES=$(run-parts --list "$USERXSESSIONDIR")

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

exit 0

# vim:set ai et sts=2 sw=2 tw=80:
