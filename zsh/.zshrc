#
# ~/.zshrc
#

# ============================================================================
# SHARED CONFIG (bash + zsh)
# ============================================================================

if [[ -f "$HOME/.config/shell/common.sh" ]]; then
  source "$HOME/.config/shell/common.sh"
fi

# ============================================================================
# KEY BINDINGS (zsh-only)
# ============================================================================

# Home/End keys
bindkey '^[[H' beginning-of-line      # Home
bindkey '^[[F' end-of-line            # End
bindkey '^[[1~' beginning-of-line     # Home (alternate)
bindkey '^[[4~' end-of-line           # End (alternate)
bindkey '^[OH' beginning-of-line      # Home (application mode)
bindkey '^[OF' end-of-line            # End (application mode)

# Delete key
bindkey '^[[3~' delete-char

# ============================================================================
# ZSH OPTIONS (zsh-only)
# ============================================================================

# History behavior (roughly matches your bash intent)
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=20000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# Globbing + directory niceties
setopt EXTENDED_GLOB
setopt AUTO_CD
setopt CORRECT

# ============================================================================
# COMPLETION (zsh-only)
# ============================================================================

# Case-insensitive-ish matching + menu completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
setopt AUTO_LIST

autoload -Uz compinit
compinit -C

# fzf keybindings & completion
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
fi

if [[ -f /usr/share/fzf/completion.zsh ]]; then
  source /usr/share/fzf/completion.zsh
fi

# ---- fzf ----
if command -v fzf >/dev/null 2>&1; then
  export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
fi

# Make Ctrl-R prettier & more useful
export FZF_CTRL_R_OPTS="
  --prompt='History> '
"

# ============================================================================
# STARSHIP PROMPT (load BEFORE syntax-highlighting)
# ============================================================================
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# ---- Autosuggestions (load before highlighting) ----
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Autosuggestion color (readable on dark backgrounds)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6a8cff'

# TAB: accept suggestion if present, otherwise do normal completion
_autosuggest_or_complete() {
  if [[ -n "$ZSH_AUTOSUGGEST_BUFFER" ]]; then
    zle autosuggest-accept
  else
    zle expand-or-complete
  fi
}
zle -N _autosuggest_or_complete
bindkey '^F' _autosuggest_or_complete

# ---- Syntax highlighting (MUST be last) ----
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
