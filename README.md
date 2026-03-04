# Public Dotfiles

My Arch Linux + Hyprland rice configuration.

> I am on a Lenovo ThinkPad X1 Carbon Gen-8 laptop
> My desktop uses nvidia GPU and i7 CPU
> Some things may need adjusted for your specific system

## What's Included

### Window Manager & Desktop
- **hypr/desktop/** & **hypr/laptop/** - Hyprland config (hyprland.conf, hyprlock.conf, hypridle.conf, hyprpaper.conf) for desktop and laptop
- **waybar/desktop/** & **waybar/laptop/** - Status bar config and styling (desktop vs laptop variants)
- **rofi/** - App launcher, power menu, window switcher, clipboard themes
- **swaync/** - Sway notification center (config + style)

### Terminals & Shell
- **kitty/** - Kitty terminal with custom 1984-dark theme
- **foot/** - Foot terminal config
- **starship/** - Cross-shell prompt config
- **zsh/** - Zsh config with keybindings and plugins
- **nano/** - Nano editor config
- **shell/** - Shared aliases and functions (sourced by bash/zsh)

### Theming
- **gtk-3.0/** & **gtk-4.0/** - GTK theme settings
- **wallpapers/** - Wallpaper collection

### System Info
- **fastfetch/** - System fetch config

### Scripts (~/.local/bin)
- **local-bin/** - kill-app, open-url-focus, screenrec-menu, start-keyring.sh, start-polkit.sh (copy to `~/.local/bin/` and make executable)

## Screenshots

<!-- Add your screenshots here -->

## Dependencies

```bash
# Core
hyprland hyprpaper hyprlock hypridle waybar hyprshutdown
# alttab: install plugin to ~/.config/hypr/plugins/alttab.so (see Hyprland wiki / AUR hyprland-alttab)

# Launchers & Notifications
rofi swaync

# Terminals
kitty foot

# Shell
starship zsh-autosuggestions zsh-syntax-highlighting nano

# Fonts (AUR)
ttf-hasklug-nerd ttf-hack-nerd
```

## Installation

These configs are meant for reference/inspiration. To use:

1. Back up your existing configs
2. Choose **hypr/desktop** or **hypr/laptop** and copy its contents to `~/.config/hypr/`. Same for **waybar/desktop** or **waybar/laptop** → `~/.config/waybar/`.
3. Copy **rofi/** to `~/.config/rofi/` and **rofi/themes/** to `~/.local/share/rofi/themes/` so the default theme (teal-cyan-dark) loads. Edit `config.rasi` to `@theme "~/.local/share/rofi/themes/cyan-mount.rasi"` if you prefer the cyan-mount theme. Copy other dirs (swaync, kitty, etc.) to the paths your apps expect.
4. **Hyprland alttab:** Configs reference `~/.config/hypr/plugins/alttab.so`. Install the alttab plugin there (AUR: hyprland-alttab) or adjust the `plugin =` line in hyprland.conf.
5. Adjust monitor names, keybinds, and app choices for your system.

## Adoption notes (keybinds & autostart)

> use your own launcher or remove binds if you don't want these

Copy **local-bin/** into `~/.local/bin/` and run `chmod +x ~/.local/bin/*`. The Hyprland config expects:

| Script | Used for | If Missing |
|--------|----------|------------|
| **start-polkit.sh** | Polkit agent (e.g. NM auth prompts) | Auth dialogs may not show |
| **start-keyring.sh** | GNOME Keyring for secrets | App passwords may not unlock |
| **kill-app** | SUPER+SHIFT+Q (force-close) | Bind does nothing |
| **screenrec-menu** | SUPER+SHIFT+R (record), waybar screenrec button | Bind/button does nothing |
| **open-url-focus** | (used by some keybinds/helpers) | Browser doesn't focus to active window onClick |

Optional wrappers not included (change keybinds if you don't use them): `discord-wayland`, `slack-xwayland`, `zoom-xwayland`, `cursor`, `notion-xwayland`.

- **Logout:** Uses `command -v hyprshutdown ... && hyprshutdown || hyprctl dispatch exit` (AUR `hyprshutdown` if installed, else `hyprctl dispatch exit`).
- **Clipboard:** Keybind SUPER+H uses `cliphist` (install and run the `exec-once` wl-paste lines from hyprland.conf).
- **Extra deps:** grim, slurp, jq, playerctl, brightnessctl, gsimplecal, nwg-menu, nwg-drawer (see waybar/rofi).

## Theme

- **Color Scheme:** Custom 1984-dark variant
- **Editor Theme:** Modified Radical
- **Fonts:** Hasklug Nerd Font (editors), Hack Nerd Font (UI)

## License

*Feel free to use and adapt. No attribution required. Use at your own risk and skill level. 
Some paths may be absolute for a reason.*

