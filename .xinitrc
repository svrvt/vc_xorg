#!/bin/bash
# Executed by startx (run your window manager from here)
exec >~/.local/share/xorg/xinitrc."${DISPLAY#:}".log 2>&1

USERXINITRCDIR=$HOME/.config/X11/xinitrc.d
USERXSESSION=$HOME/.xsession

if [ -d "$USERXINITRCDIR" ]; then
	for f in "$USERXINITRCDIR"/*; do
		test -x "$f" && . "$f"
	done
	unset f
fi
export USERXINITRC_LOADED=true

if [ "$USERXSESSION_LOADED" != "true" ]; then
	[ -f "$USERXSESSION" ] && . "$USERXSESSION"
fi
