#!/usr/bin/env bash

selection=$(slop -k)
menyoki -q cap --root --size "$selection" png save - > /home/waxer/Desktop/screenshot.png
