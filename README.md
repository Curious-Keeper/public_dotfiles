# Public Dotfiles

My Arch Linux + Hyprland rice configuration.

>Enough people asked for my dots that I made this available. I will attempt to remember and sync it weekly(ish). Use if you want, or use as an example of how not to do it. Up to you. Good luck with your build. 

## What's Included

### Window Manager & Desktop
- **hypr/** - Hyprland config (hyprland.conf, hyprlock.conf, hypridle.conf, hyprpaper.conf)
- **waybar/** - Status bar config, styling, and scripts (power-menu.sh, wifi-location.sh)
- **rofi/** - App launcher, power menu, window switcher, key hints, and power profiles themes. It is also kinda trash. I use wofi
- **wofi/** - Alternative launcher styling. the one I actually use
- **dunst/** - Notification daemon config

### Terminals & Shell
- **kitty/** - Kitty terminal with custom 1984-dark theme
- **foot/** - Foot terminal config (matching 1984-dark colors)
- **starship/** - Cross-shell prompt with OS icons, git status, language detection
- **zsh/** - Zsh config with keybindings, history, completion, fzf, autosuggestions & syntax highlighting
- **shell/** - Shared aliases and functions (sourced by bash/zsh)
- **nano/** - Nano editor config with line numbers, syntax highlighting, modern settings

### Theming
- **gtk-3.0/** & **gtk-4.0/** - GTK theme settings
- **wallpapers/** - Wallpaper collection (21 images)

### System Info
- **fastfetch/** - System fetch config

## Screenshots

<!-- Add your screenshots here -->

## Dependencies

```bash
# Core
hyprland hyprpaper hyprlock hypridle waybar

# Launchers & Notifications
rofi wofi dunst

# Terminals
kitty foot

# Shell
zsh zsh-autosuggestions zsh-syntax-highlighting fzf starship nano

# System Info
fastfetch

# Fonts (AUR)
ttf-hasklug-nerd ttf-hack-nerd
```

## Installation

These configs are meant for reference/inspiration. To use:

1. Back up your existing configs
2. Copy the directories you want to `~/.config/`
3. Source `shell/common.sh` from your `.bashrc` or `.zshrc`
4. Adjust paths and settings for your system

## Theme

- **Color Scheme:** Custom 1984-dark variant
- **Prompt:** Starship with Nord-inspired colors
- **Fonts:** Hasklug Nerd Font (editors), Hack Nerd Font (UI)

## License

Feel free to use and adapt. No attribution required.