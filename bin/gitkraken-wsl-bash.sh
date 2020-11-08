#!/bin/bash

# Mount root for windows drives, default is /mnt/ but can be changed in /etc/wsl.conf
MOUNT_ROOT=/mnt/

# Read GitKraken's hook script and arguments from STDIN
read -r GITKRAKEN_CMD

# Cleanup the path to the script:
# - Replace two or more '\' in a row with a single '/'.
# - Replace the windows drive letter (C:) with the mount point for the drive (/mnt/c)
FIXED_CMD=$(echo $GITKRAKEN_CMD | sed 's_\\\{2,\}_/_g' | sed "s_\([A-Z]\)\:/_$MOUNT_ROOT\L\1/_g")

# Run the hook script
bash $FIXED_CMD
