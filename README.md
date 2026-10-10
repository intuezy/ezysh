<div align="center">

# ⚡ ezysh
### *The terminal command palette for commands you always forget.*

[![License: MIT](https://img.shields.io/badge/License-MIT-purple.svg)](https://opensource.org/licenses/MIT)
[![Shell: Zsh | Bash | Fish](https://img.shields.io/badge/Shell-Zsh%20%7C%20Bash%20%7C%20Fish-blue.svg)]()
[![Platform: Linux | macOS | WSL](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20WSL-black.svg)]()

*Stop memorizing obscure flags, complex one-liners, and piped recipes. Hit **`Ctrl + K`** and find what you need by intent.*

<br/>

```text
┌─ ⚡ ezysh ──────────────────────────────────────────────────────────────────┐
│  kill port                                                         324/324 │
│                                              │                              │
│ ❯ [Network]  case-kill-port <port>           │   🏷  CATEGORY                │
│              │ Paksa matikan proses di port  │   Network                    │
│   [Network]  port-who <port>                 │                              │
│              │ Cek aplikasi penahan port     │   ⚡ COMMAND                  │
│   [Docker]   docker-clean-all                │   lsof -ti:<port> |          │
│              │ Bebaskan puluhan GB disk      │   xargs kill -9              │
│   [Git]      case-git-undo-commit            │                              │
│              │ Batalkan commit terakhir      │   ℹ  DESCRIPTION              │
│   [Node]     node-clean-install              │   Paksa matikan process yang │
│              │ Nuke dependencies             │   menggunakan port tertentu  │
│                                              │                              │
│                                              │   💡 PARAMETER INPUT          │
│                                              │   Press Enter to fill in     │
│                                              │   <parameters>.              │
└──────────────────────────────────────────────┴──────────────────────────────┘
```

</div>

---

## 🌟 Why ezysh?

Terminal productivity should not require memorizing hundreds of flags and syntax quirks. `ezysh` turns your shell into an IDE-like command palette:

- **🎯 Search by Intent**: Forgot the syntax? Search what you want to accomplish (`kill port`, `undo commit`, `nuke node_modules`, `clean disk`). `ezysh` indexes names, descriptions, and commands simultaneously.
- **⚡ Zero Overhead (Pure Native)**: Built with POSIX Bash and native AWK. Sub-2ms preview rendering. Zero Python runtimes, zero background daemons, zero compiled binaries.
- **🪄 Interactive Parameter Prompts**: Commands with `<port>`, `<container>`, `<url>`, or `<branch>` prompt you for input before injecting into the shell.
- **🛡 Safe Shell Injection**: Injects selected commands into your prompt buffer so you can review and tweak them before hitting `Enter`.
- **➕ Save What You Forget**: Add personal one-liners on the fly via `ezy -a`. Stored in standard TSV, searchable instantly.
- **🎨 Deep Space & Themeable**: Clean typography, sharp borders, and extensible theme overrides via `~/.config/ezysh/theme.sh`.

---

## 🌐 Compatibility Matrix

`ezysh` is designed to be lightweight and run anywhere a POSIX shell and terminal exist:

| Layer | Supported Environments |
| :--- | :--- |
| **Operating Systems** | • **Linux**: Fedora, Ubuntu, Debian, Arch, Manjaro, Pop!_OS, RHEL/CentOS, Alpine, Void, NixOS<br/>• **macOS**: Apple Silicon (M1–M4) & Intel<br/>• **Windows**: Windows Subsystem for Linux (WSL / WSL2)<br/>• **BSD**: FreeBSD, OpenBSD |
| **Shells** | • **Zsh** (Vanilla, Oh-My-Zsh, Zinit, Sheldon, Antigen)<br/>• **Bash** (4.0+ with `bind -x`)<br/>• **Fish** (3.0+ native) |
| **Terminals** | Ghostty, Kitty, Alacritty, WezTerm, iTerm2, Windows Terminal, GNOME Terminal, Konsole, Foot |
| **Multiplexers** | Zellij, tmux, GNU Screen |
| **Architectures** | `x86_64` (Intel/AMD), `arm64` / `aarch64` (Apple Silicon, Raspberry Pi, Graviton) |

---

## 📦 Curated Built-in Suites (300+ Production Recipes)

Curated defaults live in `share/defaults.tsv` as clean data, separated from execution logic:

| Category | Highlights & Scenarios |
| :--- | :--- |
| **🐳 `[Docker]`** | Service controls, auto-restart policies, system prune, instant container shell, compose lifecycle |
| **📦 `[Git]`** | Undo last commit, stash salvage, emergency discard, code diff search, prune merged branches |
| **🔌 `[Network]`** | Port killing, reverse SSH tunnels, SOCKS proxy, SSL expiry check, live traffic sniffing |
| **🟢 `[Node]`** | Nuke dependencies, kill hung dev servers, unused package audit, outdated check |
| **🦀 `[Rust]`** | Fast cargo type-check, clippy pedantic audit, release build, target directory cleanup |
| **🐹 `[Go]`** | Vendor sync, race detection, cross-compilation standalone binary, hot reload |
| **🐍 `[Python]`** | Virtual environments, fast ruff linting, test coverage, ASGI FastAPI dev server |
| **🗄️ `[Database]`** | Prisma studio/push, PostgreSQL dump & restore, Redis cache flushes |
| **🔍 `[Forensics]`** | Fileless malware audit, deleted running binaries, IoC extraction, persistence check |
| **🚑 `[Recovery]`** | Rescue deleted files from `/proc/*/fd`, Ext4 superblock restore, Btrfs salvage, `ddrescue` |
| **🐧 `[Linux]`** | Disk space hogs, service health, clean config views, journald filters |
| **🎯 `[Cases]`** | Multi-pipe workflows solving complex real-world developer edge cases |

---

## 🚀 Installation

### 1. One-Line Automated Installer (Recommended)
```bash
curl -fsSL https://raw.githubusercontent.com/intuezy/ezysh/main/install.sh | bash
```

---

### 2. Manual Installation

#### Zsh
```bash
git clone https://github.com/intuezy/ezysh.git ~/.ezysh
echo "source ~/.ezysh/ezysh.plugin.zsh" >> ~/.zshrc
source ~/.zshrc
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
| **`Ctrl + K`** | Open interactive command palette |
| **`Ctrl + Space`** | Alternative keybinding to open palette |
| **`ezy` / `ezysh`** | Launch palette from shell prompt |
| **`ezy -a <name> <cmd> <desc> [cat]`** | Quick add a new command snippet |
| **`ezy -s` / `ezysh --sync`** | Re-index defaults and custom commands |
| **`ezy -e` / `ezysh --edit`** | Open `custom.tsv` in default `$EDITOR` |
| **`ezy -l` / `ezysh --list`** | Print entire commands database to stdout |

---

## 💡 Adding Custom Commands ("Save What You Forget")

### Via CLI:
```bash
ezy -a "deploy-prod" "./deploy.sh --prod" "Deploy main branch to production" "DevOps"
```

### Via Config File (`~/.config/ezysh/custom.tsv`):
```tsv
deploy-prod	./deploy.sh --prod	[DevOps] Deploy main branch to production
suhu-cek	suhu	[Hardware] Cek suhu laptop CPU & SSD
```
Custom commands are re-indexed instantly.

---

## 📋 Requirements

- **`fzf`** (Command-line fuzzy finder)
- **`bash`** (4.0+ for launcher runtime)
- **`zsh`**, **`bash`**, or **`fish`** (Your active interactive shell)

*Zero Python, Node.js, or external compiled dependencies required.*

---

## 🤝 Contributing

Contributions are welcome. Adding a new command is as simple as adding a line to `share/defaults.tsv`:

1. Check out our **[Contributing Guidelines](CONTRIBUTING.md)**.
2. Ensure automated tests pass: `bash ./tests/test_ezysh.sh`.
3. Open a Pull Request.

---

## 📜 License

MIT License © 2026 [intuezy](https://github.com/intuezy)
