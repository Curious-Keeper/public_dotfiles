#!/usr/bin/env bash
HOME_SSID="Verizon_9BNP9F"

SSID="$(nmcli -t -f ACTIVE,TYPE,NAME connection show --active 2>/dev/null \
  | awk -F: '$1=="yes" && $2=="802-11-wireless" {print $3; exit}')"

SIGNAL="$(nmcli -t -f IN-USE,SIGNAL dev wifi 2>/dev/null \
  | awk -F: '$1=="*" {print $2; exit}')"
[[ -z "$SIGNAL" ]] && SIGNAL="?"

if [[ -z "$SSID" ]]; then
  echo "{\"text\":\"OFFLINE\",\"class\":\"offline\"}"
elif [[ "$SSID" == "$HOME_SSID" ]]; then
  echo "{\"text\":\"HOME\",\"class\":\"home\"}"
else
  echo "{\"text\":\"AWAY\",\"class\":\"away\"}"
fi
