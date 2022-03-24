#!/bin/bash

# Intended to be ran in a directory that contains a group of folders of the different icon sizes
# (16x16, 22x22, ect (see sizes array below))
# that contain the correspondingly sized icons that you wish to replace a certain icon of the current
# theme with. The script then takes those files and copies them over the icons that are in the icon
# pack. This will cause the icon pack to be marked as broken if you do eopkg check

# the example here is to set the icon of the software center to the solus logo while using the 
# rest of the Papirus theme

ICON_NAME_TO_ADD="distributor-logo-solus.svg"
ICON_NAME_TO_REPLACE="system-software-install.svg"
ICON_PACK="Papirus"

declare -a SIZES=("16x16" "22x22" "24x24" "32x32" "48x48" "64x64")
for SIZE in "${SIZES[@]}"
do
	ORIGINAL_FILE="./$SIZE/$ICON_NAME_TO_ADD"
	if test -f "$ORIGINAL_FILE"; then
		NEW_FILE="/usr/share/icons/$ICON_PACK/$SIZE/apps/$ICON_NAME_TO_REPLACE"
		echo "Moving $ORIGINAL_FILE to $NEW_FILE"
		cp "$ORIGINAL_FILE" "$ORIGINAL_FILE.tmp"
		mv "$ORIGINAL_FILE.tmp" "$NEW_FILE"
	else
		echo "$ORIGINAL_FILE does not exist"
	fi
	
done
