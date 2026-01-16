# ~/.config/shell/common.sh
# Shared shell config for Bash + Zsh
# Put portable exports, aliases, and functions here.

# ============================================================================
# PATH
# ============================================================================
export PATH="$HOME/.local/bin:$PATH"

# ============================================================================
# COLORS / TERMINAL ENHANCEMENTS
# ============================================================================
export CLICOLOR=1

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;36m'
export LESS_TERMCAP_ue=$'\e[0m'

# SSH agent socket (gnome-keyring style)
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/keyring/ssh"

# ============================================================================
# ALIASES - CORE
# ============================================================================
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'

alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -ltrh'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'

alias rm='rm -I --preserve-root'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias df='df -h'
alias du='du -h'
alias free='free -h'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%Y-%m-%d %H:%M:%S"'
alias week='date +%V'

# ============================================================================
# ALIASES - GIT
# ============================================================================
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate -10'
alias gla='git log --oneline --graph --decorate --all'
alias gd='git diff'
alias gds='git diff --staged'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gst='git stash'
alias gstp='git stash pop'

# ============================================================================
# ALIASES - SYNCTHING
# ============================================================================
alias syncup='systemctl --user start syncthing && sleep 2 && xdg-open http://localhost:8384 >/dev/null 2>&1 & echo "Syncthing started + Web UI opened"'
alias syncdown='systemctl --user stop syncthing && echo "Syncthing stopped"'
alias syncstatus='systemctl --user status syncthing'

# ============================================================================
# ALIASES - DEV SERVERS
# ============================================================================
alias killdev='pkill -f "npm run dev"'

# ============================================================================
# ALIASES - HYPRLAND
# ============================================================================
alias wallpaper-reload='echo "Refreshing wallpaper..." && pkill -f hyprpaper && sleep 0.5 && hyprctl dispatch exec "hyprpaper" && echo "Done!"'
alias restartwaybar='pkill -9 waybar && nohup waybar >/dev/null 2>&1 &'

# ========================================================================
# ALIASES - RANDOM
# ========================================================================
alias matrix='cmatrix -C cyan -s'
alias intro='echo "Hello, world, I am" && whoami && echo "You are not alone" && echo "Wake up, ..." && sleep 2 && matrix'

# ============================================================================
# ALIASES - SYSTEM (Arch helpers)
# ============================================================================
if command -v pacman >/dev/null 2>&1; then
  alias pacup='sudo pacman -Syu'
  alias pacin='sudo pacman -S'
  alias pacrem='sudo pacman -Rns'
  alias pacsearch='pacman -Ss'
  alias pacinfo='pacman -Qi'
  alias pacclean='sudo pacman -Sc'
  alias pacorphan='pacman -Qtdq'
fi

if command -v yay >/dev/null 2>&1; then
  alias yayup='yay -Syu'
  alias yayin='yay -S'
  alias yaysearch='yay -Ss'
fi

# ============================================================================
# FUNCTIONS
# ============================================================================
mkcd() { mkdir -p "$1" && cd "$1"; }

extract() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"     ;;
      *.tar.gz)    tar xzf "$1"     ;;
      *.tar.xz)    tar xJf "$1"     ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar x "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       unzip "$1"       ;;
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

ff() { find . -type f -iname "*$1*"; }
fd() { find . -type d -iname "*$1*"; }
