#!/bin/bash
# Executed by startx (run your window manager from here)

exec >~/.local/share/xorg/xinitrc."${DISPLAY#:}".log 2>&1
echo loaded .xinitrc $0

USERXINITRCDIR="$HOME/.config/X11/xinitrc.d"
if [ -d "$USERXINITRCDIR" ]; then
	for f in "$USERXINITRCDIR"/*; do
		test -x "$f" && . "$f"
	done
	unset f
fi
USERXINITRC_LOADED="true"

USERXSESSION="$HOME/.xsession"
if [ "$USERXSESSION_LOADED" != "true" ]; then
	[ -f "$USERXSESSION" ] && . "$USERXSESSION"
fi
