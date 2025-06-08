#!/bin/bash
# Executed by startx (run your window manager from here)
exec >~/.local/share/xorg/xinitrc."${DISPLAY#:}".log 2>&1
echo loaded .xinitrc $0

USERXSESSION="$HOME/.xsession"
USERXINITRCDIR="$HOME/.config/X11/xinitrc.d"

if [ -d "$USERXINITRCDIR" ]; then
	for f in "$USERXINITRCDIR"/*; do
		test -x "$f" && . "$f"
	done
	unset f
fi

[ "$0" != "$USERXSESSION" ] && [ -f "$USERXSESSION" ] && . "$USERXSESSION"
