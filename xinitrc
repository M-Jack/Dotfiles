[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources


xset -b
xscreensaver -no-splash &         # starts screensaver daemon

feh --bg-scale ~/.background.jpg &

redshift-gtk &
xrandr --output HDMI-A-0 --auto --set audio off

which touchpad_toggle.sh && touchpad_toggle.sh

exec i3 #start the WM
