<div align="center">

# ⚡ ezysh
### *The aesthetic, intuitive command palette & alias launcher for your shell.*

[![License: MIT](https://img.shields.io/badge/License-MIT-purple.svg)](https://opensource.org/licenses/MIT)
[![Shell: Zsh | Bash | Fish](https://img.shields.io/badge/Shell-Zsh%20%7C%20Bash%20%7C%20Fish-blue.svg)]()
[![Platform: Linux | macOS | WSL](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20WSL-black.svg)]()

*Stop forgetting your complex one-liners, aliases, and shell recipes. Jump into your personal command palette with **`Ctrl + K`**.*

<br/>

```text
┌─ ⚡ ezysh ───────────────────────────────────────────────────────────────┐
│                                                                 213/213│
│                                           │                              │
│ ❯ [Docker]   docker-clean-all             │   🏷  CATEGORY                │
│   [Git]      case-git-undo-commit         │   Docker                     │
│   [Network]  case-kill-port <port>        │                              │
│   [Node]     node-clean-install           │   ⚡ COMMAND                  │
│   [Database] prisma-studio                │   docker system prune -af    │
│   [API]      api-post-json <url>          │   --volumes                  │
│   [Linux]    disk-usage-top               │                              │
│   [Forensics]case-proc-deleted-running    │   ℹ  DESCRIPTION              │
│                                           │   Bebaskan puluhan GB disk   │
│                                           │   dari cache & sampah docker │
└───────────────────────────────────────────┴──────────────────────────────┘
```

</div>

---

## 🌟 Why ezysh?

Terminal productivity shouldn't mean memorizing hundreds of obscure flags and piped commands. `ezysh` turns your shell into a modern, aesthetic IDE-like command palette:

- **⚡ Sub-Millisecond Search**: Powered by `fzf` with zero latency.
- **🏷 Category-First Filtering**: Type `docker`, `git`, `network`, `node`, `database`, `api`, or `linux` to filter instantly.
- **🪄 Interactive Parameter Prompts**: Commands with `<port>`, `<url>`, `<branch>`, or `<name>` prompt you for input before injecting into the shell.
- **🔄 Zero-Config Shell Auto-Sync**: Automatically reads and indexes all aliases and comments from your `~/.zshrc`, `~/.bashrc`, or Fish configs.
- **🛡 Safe Injection**: Injects commands directly into your prompt buffer so you can inspect/tweak them before hitting `Enter`.
- **🌸 Deep Space Palette**: Clean typography, pixel-perfect borders, and syntax-safe preview cards.
- **➕ Quick Add Snippets**: Add new personal commands on the fly via `ezy --add`.

---

## 🌐 Compatibility Matrix

`ezysh` is designed to be ultra-lightweight and run seamlessly anywhere a POSIX shell and terminal exist:

| Layer | Supported Environments |
| :--- | :--- |
| **Operating Systems** | • **Linux**: Fedora, Ubuntu, Debian, Arch, Manjaro, Pop!_OS, RHEL/CentOS, Alpine, NixOS<br/>• **macOS**: Apple Silicon (M1/M2/M3/M4) & Intel (Sonoma, Ventura, Monterey)<br/>• **Windows**: Windows Subsystem for Linux (WSL / WSL2)<br/>• **BSD**: FreeBSD, OpenBSD |
| **Shells** | • **Zsh** (Vanilla, Oh-My-Zsh, Zinit, Sheldon, Antigen — Emacs & Vi mode)<br/>• **Bash** (4.0+ with `bind -x`)<br/>• **Fish** (3.0+ native) |
| **Terminals** | Ghostty, Kitty, Alacritty, WezTerm, iTerm2, Windows Terminal, GNOME Terminal, Konsole, Foot, Rio |
| **Multiplexers** | Zellij, tmux, GNU Screen |
| **Architectures** | `x86_64` (Intel/AMD), `arm64` / `aarch64` (Apple Silicon, Raspberry Pi, AWS Graviton) |

---

## 📦 Curated Built-in Suites (210+ Production Recipes)

| Category | Highlights & Scenarios |
| :--- | :--- |
| **🐳 `[Docker]`** | System prune, bulk stop/rm, instant container shell, live resource stats, inspect IP |
| **📦 `[Git]`** | Undo last commit, emergency workspace discard, search history by code changes, prune merged branches |
| **🔌 `[Network]`** | Port killing, DNS hierarchy trace, multi-resolver benchmark, SSL expiry check, live traffic sniffing |
| **🟢 `[Node]`** | Nuke & reinstall dependencies, kill hung dev servers, detect unused packages, outdated check |
| **🗄️ `[Database]`** | Prisma studio, migrate, db push, PostgreSQL dump/restore, Redis cache flush |
| **🌐 `[API]`** | Pretty JSON POST testing, Bearer token requests, TTFB latency measurement |
| **🔍 `[Forensics]`** | Fileless malware detection, deleted running binaries, IoC extraction, crontab persistence audit |
| **🐧 `[Linux]`** | Disk hogs locator, permission recovery, systemd error filters, clean config reader, live logs |
| **🎯 `[Cases]`** | End-to-end multi-pipe recipes solving complex real-world workflows |

---

## 🚀 Installation

### 1. One-Line Automated Installer (Recommended)
```bash
curl -fsSL https://raw.githubusercontent.com/intuezy/ezysh/main/install.sh | bash
```

---

### 2. Manual Installation

#### Zsh (Default / Oh-My-Zsh / Zinit)
```bash
git clone https://github.com/intuezy/ezysh.git ~/.ezysh
echo "source ~/.ezysh/ezysh.plugin.zsh" >> ~/.zshrc
source ~/.zshrc
```

*Using Oh-My-Zsh custom plugins:*
```bash
git clone https://github.com/intuezy/ezysh.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/ezysh
# Add 'ezysh' to plugins=(... ezysh) in your ~/.zshrc
```

#### Bash
```bash
git clone https://github.com/intuezy/ezysh.git ~/.ezysh
echo "source ~/.ezysh/ezysh.plugin.bash" >> ~/.bashrc
source ~/.bashrc
```

#### Fish
```bash
git clone https://github.com/intuezy/ezysh.git ~/.ezysh
ln -s ~/.ezysh/ezysh.fish ~/.config/fish/conf.d/ezysh.fish
```

---

## ⌨️ Keybindings & Usage

| Shortcut / Command | Action |
| :--- | :--- |
| **`Ctrl + K`** | Open `ezysh` interactive command palette |
| **`Ctrl + Space`** | Alternative keybinding to launch palette |
| **`ezy` / **`ezysh`** | Launch palette from shell prompt |
| **`ezy --add <name> <cmd> <desc> [cat]`** | Quick add a new command snippet |
| **`ezy --sync`** | Force re-index shell aliases & defaults |
| **`ezy --edit`** | Open `custom.tsv` in your default `$EDITOR` |
| **`ezy --list`** | Print entire commands database to stdout |

---

## 💡 Adding Custom Commands

### Via CLI:
```bash
ezy --add "deploy-prod" "./deploy.sh --prod" "Deploy main branch to production" "DevOps"
```

### Via Config File (`~/.config/ezysh/custom.tsv`):
```tsv
deploy-prod	./deploy.sh --prod	[DevOps] Deploy main branch to production
my-script <target>	python3 script.py --target <target>	[Python] Run automation script
```
*Run `ezy --sync` after editing.*

---

## 📋 Requirements
- `fzf` (Fuzzy finder)
- `python3` (Safe preview card renderer)
- `zsh`, `bash`, or `fish`

---

## 🤝 Contributing

Contributions are welcome! Whether you'd like to propose a new command recipe, fix a bug, or add shell integrations:
1. Check out our **[Contributing Guidelines](CONTRIBUTING.md)**.
2. Propose new command recipes using our **[Command Proposal Template](https://github.com/intuezy/ezysh/issues/new?template=command_proposal.md)**.

---

## 📜 License

MIT License © 2026 [intuezy](https://github.com/intuezy)
