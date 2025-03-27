# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search
  zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

# Powerlevel10k Settings
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases für Produktivität
alias moin="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"
alias ll='ls -lah --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias nvim='nvim'

# Schneller in den Editor springen
export EDITOR=nvim

# Syntax-Highlighting für weniger Tippfehler
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Auto-Suggestions Farben anpassen
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"

# History schneller durchsuchen
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# FZF Integration für bessere Suche
if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --zsh)"
fi

# Pfad anpassen
export PATH="$HOME/bin:$PATH"
#typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
#neofetch
