#!/bin/bash
# start-keyring.sh
# Wrapper script to safely start gnome-keyring-daemon
# Exports environment variables to D-Bus/systemd so apps can access the keyring

if [ -x /usr/bin/gnome-keyring-daemon ]; then
    # Start gnome-keyring-daemon and capture output
    eval $(/usr/bin/gnome-keyring-daemon --start --components=secrets,ssh)
    
    # Export keyring environment to D-Bus and systemd so GUI apps can access it
    dbus-update-activation-environment --systemd SSH_AUTH_SOCK GNOME_KEYRING_CONTROL
    
    # Verify it's running
    if pgrep -x gnome-keyring-daemon > /dev/null; then
        exit 0
    else
        echo "Warning: gnome-keyring-daemon failed to start" >&2
        exit 1
    fi
else
    echo "Warning: gnome-keyring-daemon not found at /usr/bin/gnome-keyring-daemon" >&2
    exit 1
fi

