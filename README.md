<div align="center">

# ⚡ ezysh
**The aesthetic, blazing-fast command palette & alias launcher for your terminal.**

[![License: MIT](https://img.shields.io/badge/License-MIT-purple.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Shell-Zsh%20%7C%20Bash%20%7C%20Fish-blue.svg)]()
[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS-black.svg)]()

*Stop forgetting your complex one-liners, aliases, and shell recipes. Jump into your personal command palette with `Ctrl + K`.*

</div>

---

## ✨ Features

- **⚡ Instant Fuzzy Search**: Fuzzy-find any command, shell alias, or recipe in less than `1ms`.
- **🏷 Category-First Filtering**: Type `docker`, `network`, `git`, `forensics`, `linux`, or `case` to filter commands by domain immediately.
- **🪄 Interactive Parameter Replacement**: If a command has `<port>`, `<url>`, `<branch>`, `ezysh` prompts you to fill it in before injecting to your prompt.
- **🔄 Auto-Syncs with Shell**: Automatically indexes all aliases and comments from your `~/.zshrc`, `~/.bashrc`, or Fish configs.
- **✨ Safe Execution**: Injects directly into your active ZLE prompt without executing blindly, so you can inspect/modify before pressing Enter.
- **🌸 Deep Space Minimalist Palette**: Clean Japanese typography, zero clunky borders, pixel-perfect preview cards.
- **➕ Quick Add Snippets**: Add new commands from anywhere via `ezy --add`.

---

## 📦 Curated Built-in Suites

`ezysh` comes out of the box with over **190+ production-grade commands and recipes**:

1. **🐳 `[Docker]`**: System prune, bulk stop/rm, instant container shell, live resource stats, IP inspect.
2. **📦 `[Git]`**: Undo last commit, emergency workspace discard, search history by code changes, prune merged branches.
3. **🔌 `[Network]`**: Port killing, DNS hierarchy trace, multi-resolver benchmark, SSL expiry check, live traffic sniffing.
4. **🔍 `[Forensics]`**: Fileless malware detection, deleted running binaries, IoC extraction, crontab persistence audit, SHA256 trees.
5. **🐧 `[Linux]`**: Disk hogs locator, permission recovery, systemd error filters, clean config reader, live logs.
6. **🎯 `[Cases]`**: End-to-end multi-pipe recipes solving real-world scenarios.

---

## 🚀 Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/intuezy/ezysh/main/install.sh | bash
```

Or clone manually:
```bash
git clone https://github.com/intuezy/ezysh.git ~/.ezysh
mkdir -p ~/.local/bin
ln -s ~/.ezysh/bin/ezysh ~/.local/bin/ezysh
ln -s ~/.ezysh/bin/ezysh ~/.local/bin/ezy
```

Add to your `~/.zshrc`:
```bash
source ~/.ezysh/ezysh.plugin.zsh
```

---

## ⌨️ Keybindings & Usage

| Trigger | Action |
| :--- | :--- |
| **`Ctrl + K`** | Open `ezysh` interactive command palette |
| **`Ctrl + Space`** | Alternative keybinding for opening `ezysh` |
| **`ezy` / `ezysh`** | Open palette directly from terminal |
| **`ezy --add <name> <cmd> <desc> [cat]`** | Quick add a new snippet to your database |
| **`ezy --sync`** | Manually force sync aliases & defaults |
| **`ezy --edit`** | Open `custom.tsv` in your default `$EDITOR` |

---

## 💡 Quick Add Example

```bash
ezy --add "deploy-prod" "git push origin main && ./deploy.sh" "Deploy master branch to production" "DevOps"
```

---

## 📜 License

MIT License © 2026 [intuezy](https://github.com/intuezy)
