#!/bin/bash

# works as of budgie 10.6
# intended to be called as the executable for a systemd timer, I found this article useful:
# https://fedoramagazine.org/systemd-timers-for-scheduling-tasks/

# customize as needed
USERNAME=""
SCREENSAVER_DIR="/home/$USERNAME/Pictures/screensavers/"
LOG_PATH="/home/$USERNAME/solus/wallpaper_switcher_log.txt"


WALLPAPER=$(ls $SCREENSAVER_DIR | sort -R | tail -1)
printf "set wallpaper to $WALLPAPER at $(date)" >> "$LOG_PATH"

gsettings set org.gnome.desktop.background picture-uri "file://$SCREENSAVER_DIR$WALLPAPER"
gsettings set org.gnome.desktop.screensaver picture-uri "file://$SCREENSAVER_DIR$WALLPAPER"
printf "[Greeter]\nbackground=$SCREENSAVER_DIR$WALLPAPER" > "/home/$USERNAME/solus/slick-greeter.conf"
