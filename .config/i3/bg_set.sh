#!/bin/sh

if [ $USER = "derek" ]; then
    WALLPAPER=${HOME}/Pictures/wallpapers/archlinux.png
elif [ $USER = "derek-work" ]; then
    WALLPAPER=${HOME}/Pictures/wallpapers/astronaut.jpg
fi

feh --bg-fill $WALLPAPER

