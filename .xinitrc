#!/bin/sh
# Executed by startx (run your window manager from here)

exec >>~/.xsession-errors 2>&1
echo "Starting .xinitrc"
env >~/.xinitrc_env.log

# [ -f ~/.xsessionrc ] && . ~/.xsessionrc
# [ -f ~/.xprofile ] && . ~/.xprofile
# echo "Xsessionrc loaded"

default_session="awesome"

if [ "$1" = xterm ] && [ -n "$2" ]; then
	session="$2"
elif [ -z "$1" ]; then
	if [ -e ~/.WM.default ]; then
		session="$("$HOME/.WM.default")"
	else
		session="$default_session"
	fi
else
	session="$1"
fi

printf '%s\n' "$session" >"$HOME/.WM.last"

echo "Starting $session"

# exec dbus-launch --sh-syntax --exit-with-session "$session"
# exec $session

case $session in
awesome | herbstluftwm | bspwm | dwm | unity | xmonad)
	STARTUP="$STARTUP $session"
	;;

cinnamon | mate | openbox)
	STARTUP="$STARTUP $session-session"
	;;

xfce4 | kde)
	STARTUP="$STARTUP start$session"
	;;

*)
	STARTUP="$STARTUP $session"
	;;
esac

if [ -f /etc/X11/Xsession ]; then
	. /etc/X11/Xsession
else
	userresources=$HOME/.Xresources
	usermodmap=$HOME/.Xmodmap
	if [ -f "$userresources" ]; then xrdb -merge "$userresources"; fi
	if [ -f "$usermodmap" ]; then xmodmap "$usermodmap"; fi

	exec $STARTUP
fi
