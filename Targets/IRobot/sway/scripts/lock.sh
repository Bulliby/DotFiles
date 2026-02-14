#!/bin/sh
IMG=$(mktemp -u --suffix=.lock.png)
scrot "$IMG"
convert "$IMG" -blur 2x2  -charcoal 1 -colorize 70% "$IMG"
convert "$IMG" -blur 1x1  -implode 1 -colorize 20% "$IMG"
#convert "$IMG" -pointsize 52 -fill white -draw 'text 300,200 "TxGVNN"' "$IMG"
convert "$IMG" -scale 22% -scale 500% "$IMG"
convert "$IMG" ~/.i3/bin/lock.png -gravity center -composite -matte "$IMG"
if ! swaylock -i "$IMG"; then
    rm "$IMG"
    return 1
fi
xset dpms force off
rm "$IMG"
