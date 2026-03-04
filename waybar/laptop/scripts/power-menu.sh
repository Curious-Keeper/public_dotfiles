#!/usr/bin/env bash

# Entries (icon + label). Markup allowed.
entries="  Lock
  Suspend
  Logout
  Reboot
  Shutdown"

choice="$(printf "%s\n" "$entries" | rofi -dmenu -p "Power" -theme ~/.config/rofi/powermenu.rasi)"

case "$choice" in
  "  Lock")      hyprlock ;;
  "  Suspend")   systemctl suspend-then-hibernate || systemctl suspend ;;
  "  Logout")    command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit;;
  "  Reboot")    systemctl reboot ;;
  "  Shutdown")  systemctl poweroff ;;
  *) exit 0 ;;
esac
