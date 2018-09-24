xrdb -merge ~/.Xresources
xset b off
xset +fp /usr/share/fonts/local &
xset fp rehash &
exec ~/.config/scripts/dwm_status.sh &
exec ~/.config/scripts/lock_screen_on_close.sh &
exec ~/.config/scripts/low_battery_notify.sh &
exec feh --bg-scale ~/Pictures/sea_turtle.jpg &
exec redshift -l 42.24:-71.07 -t 5700:3600 -g 0.8 -m randr -v &
exec safeeyes &
exec nextcloud &
exec slack &
exec thunderbird &
exec dwm
