#!/usr/bin/env bash

# Entries (icon + label). Markup allowed.
entries="  Lock
  Suspend
  Logout
  Reboot
  Shutdown"

choice="$(printf "%s\n" "$entries" | wofi --show dmenu \
  --prompt 'Power' \
  --style ~/.config/wofi/style.css \
  --allow-markup \
  --width 280 --hide-scroll --no-actions)"

case "$choice" in
  "  Lock")      hyprlock ;;
  "  Suspend")   systemctl suspend-then-hibernate || systemctl suspend ;;
  "  Logout")    hyprctl dispatch exit ;;
  "  Reboot")    systemctl reboot ;;
  "  Shutdown")  systemctl poweroff ;;
  *) exit 0 ;;
esac
