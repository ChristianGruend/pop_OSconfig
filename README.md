# Pop!_OS Konfiguration

Dieses Repository enthält meine personalisierten Konfigurationen für Pop!_OS mit automatischer Installation.

## 📂 Enthaltene Konfigurationen
- **Zsh & Oh My Zsh**: Anpassungen für eine optimierte Shell-Erfahrung
- **Powerlevel10k**: Theme mit praktischen Informationen und Icons
- **Tilix**: Terminal-Einstellungen und Shortcuts
- **Git**: Globale Konfiguration für effizienteres Arbeiten
- **VS Code**: User-Settings und Extensions für eine bessere Entwicklungserfahrung

## 🚀 Schnellstart
Die einfachste Methode zur Installation:

```bash
# Repository klonen
git clone git@github.com:vongustlson/Pop_OSconfig.git ~/Devops/github/ChristianGruend/Pop_OSconfig
cd ~/Devops/github/ChristianGruend/Pop_OSconfig

# Installationsskript ausführen
chmod +x install_terminal.sh
./install_terminal.sh
```

## 🛠️ Was wird installiert?
Das Installationsskript richtet automatisch folgendes ein:
- Tilix Terminal-Emulator
- Zsh als Standard-Shell
- Oh My Zsh Framework
- Powerlevel10k Theme
- Nützliche Zsh-Plugins:
  - zsh-autosuggestions
  - zsh-syntax-highlighting
  - zsh-history-substring-search
  - zsh-autocomplete
- Optimierte .zshrc und .p10k.zsh Konfigurationen

## 🔄 Manuelle Installation (optional)
Falls Sie die Konfigurationsdateien manuell verwalten möchten:

```bash
# Symlinks für Konfigurationsdateien setzen
ln -s ~/Devops/github/ChristianGruend/Pop_OSconfig/.zshrc ~/.zshrc
ln -s ~/Devops/github/ChristianGruend/Pop_OSconfig/.p10k.zsh ~/.p10k.zsh
```

## 📝 To-Do
- [ ] Weitere nützliche Tools hinzufügen
- [ ] VS Code Konfiguration automatisieren
- [ ] Terminal Konfiguration dokumentieren

---
✍️ Erstellt von [gustl](https://github.com/ChristianGruend )
