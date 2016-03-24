[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources


xset -b
stalonetray & # Control tray
xscreensaver -no-splash &         # starts screensaver daemon
xsetroot -cursor_name left_ptr &  # sets the cursor icon
udiskie -C -0 -a -n -s -P &
cbatticon & # icon for the battery usage
blueman-applet & # Bluetooth applet

feh --bg-scale ~/.background.jpg &

redshift-gtk &

xbindkeys

if xinput list | grep "TPPS/2 IBM TrackPoint"  ; then
	xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
	xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
	xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
	xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
	xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.75
	if which touchpad_toggle.sh ; then touchpad_toggle.sh
	fi	
fi

exec xmonad #start the WM
