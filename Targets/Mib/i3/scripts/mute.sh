#!/bin/bash

amixer get Master | sed 5q | grep -q '\[on\]'

if [ $? -eq 0 ]; then
    amixer set Master mute
else
    amixer set Master unmute
fi
