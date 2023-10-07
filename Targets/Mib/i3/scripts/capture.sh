#!/usr/bin/env bash

selection=$(slop -k 2> /dev/null || true)
menyoki -q cap --root --size "$selection" png save - > $HOME/Desktop/screenshot.png
