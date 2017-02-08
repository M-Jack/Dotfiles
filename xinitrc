[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources


xset -b
xscreensaver -no-splash &         # starts screensaver daemon
udiskie -C -0 -a -n -s -P &

feh --bg-scale ~/.background.jpg &

redshift-gtk &
xrandr --output HDMI-A-0 --auto --set audio off


exec i3 #start the WM
