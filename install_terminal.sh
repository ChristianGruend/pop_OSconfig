#!/bin/bash

echo "🔧 Installiere Tilix, Zsh und benötigte Pakete..."
sudo apt update && sudo apt install -y tilix zsh git curl wget fonts-powerline

echo "⚙️ Setze Zsh als Standard-Shell..."
chsh -s $(which zsh)

echo "💾 Installiere Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "🎨 Installiere Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "🔌 Installiere Oh My Zsh Plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/marlonrichert/zsh-autocomplete ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete

echo "⚡ Lade Powerlevel10k-Konfiguration herunter..."
curl -fsSL https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/.p10k.zsh -o ~/.p10k.zsh

echo "🛠️ Erstelle .zshrc mit erweiterten Funktionen..."
cat > ~/.zshrc << 'EOF'
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
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
neofetch
source /opt/homebrew/bin/brew shellenv
EOF

echo "✅ Installation abgeschlossen! Starte dein Terminal neu oder führe 'exec zsh' aus."
