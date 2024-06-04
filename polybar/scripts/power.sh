#!/usr/bin/env bash

poweroff="poweroff"
restart="restart"
hibernate="hibernate"
logout="logout"
cancel="cancel"
options="$poweroff|$restart|$hibernate|$logout|$cancel"

chosen="$(echo -n $options | rofi -theme "~/.config/rofi/launchers/type-1/style-11.rasi" -theme-str "listview { scrollbar: false; }"  -sep "|" -dmenu -p "$(whoami)")"
case $chosen in
	$poweroff)
		shutdown now
		;;
	$restart)
		reboot
		;;
	$hibernate)
		systemctl suspend
		;;
	$logout)
		loginctl terminate-user $USER
		;;
	$cancel)
		exit 0
		;;
esac
