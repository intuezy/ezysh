<div align="center">

# ⚡ ezysh

### *The aesthetic, intuitive command palette & alias launcher for your shell.*

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Shell-Zsh%20%7C%20Bash%20%7C%20Fish-purple?style=flat-square)](https://github.com/intuezy/ezysh)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

**ezysh** brings the smooth, modern **Command Palette (`Ctrl + K`)** experience of VS Code and Raycast directly into your terminal. Never forget your `.zshrc` aliases, complex docker flags, or git shortcuts again.

</div>

---

## ✨ Features

- 🎯 **Direct Prompt Injection (Safe)** — Injects chosen commands directly into your shell line buffer (`BUFFER`), allowing you to review, edit, or adjust flags before hitting Enter.
- 🔄 **Auto-Sync from Shell Config** — Automatically parses aliases, comments, and section headers from your `~/.zshrc` or `~/.bashrc` with 0 manual effort.
- 🧩 **Interactive Parameter Replacement** — Detects placeholders like `<branch>`, `<package>`, `<pid>`, or `<file>` and prompts you to fill them in interactively.
- 🎨 **Aesthetic & Transparent UI** — Seamlessly blends into your terminal's background blur and color scheme (`bg:-1`).
- ⚡ **Zero-Bloat & Instant (0ms latency)** — Powered by `fzf` and pure shell. No heavy runtime or bulky compiler dependencies required.

---

## ⚡ Quick Start

### 1. One-Line Installer
```bash
curl -fsSL https://raw.githubusercontent.com/intuezy/ezysh/main/install.sh | bash
```

---

### 2. Manual Installation / Plugin Managers

#### Oh-My-Zsh
```bash
git clone https://github.com/intuezy/ezysh.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/ezysh
```
Add `ezysh` to your plugins in `~/.zshrc`:
```zsh
plugins=(... ezysh)
```

#### Zinit
```zsh
zinit light intuezy/ezysh
```

#### Manual (Zsh / Bash)
Clone the repository and add it to your PATH:
```bash
git clone https://github.com/intuezy/ezysh.git ~/.ezysh
echo 'export PATH="$HOME/.ezysh/bin:$PATH"' >> ~/.zshrc
echo 'source ~/.ezysh/ezysh.plugin.zsh' >> ~/.zshrc
source ~/.zshrc
```

---

## ⌨️ Usage

| Trigger / Command | Action |
| :--- | :--- |
| `Ctrl + K` / `Ctrl + Space` | Open interactive command palette anywhere in your terminal |
| `ezy` / `ezysh` | Launch palette via CLI |
| `ezy --sync` | Manually re-sync aliases from `~/.zshrc` |
| `ezy --edit` | Open custom cheatsheet file (`~/.config/ezysh/custom.tsv`) |
| `ezy --list` | Print all registered commands in plain text |

---

## 🧩 Interactive Parameter Replacement

Commands with bracketed placeholders will automatically trigger a mini prompt before writing to your prompt:

```bash
# Selecting:
gco <branch>

# Triggers:
⚡ Enter <branch> (press Enter to skip): feature/login

# Injects into terminal:
git checkout feature/login
```

---

## 🎨 Custom Commands

Want to add custom workflow snippets without defining shell aliases? Edit your custom file:

```bash
ezy --edit
# or open ~/.config/ezysh/custom.tsv
```

Format (`Tab`-separated):
```tsv
Name <TAB> Command to execute <TAB> [Category] Description
```

Example:
```tsv
docker-prune	docker system prune -af --volumes	[Docker] Remove all unused containers & images
k8s-pods	kubectl get pods -A -o wide	[K8s] List all pods across all namespaces
```

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
Feel free to check the [issues page](https://github.com/intuezy/ezysh/issues).

---

## 📄 License

Distributed under the **MIT License**. See [LICENSE](LICENSE) for more information.

<div align="center">
Built with 💜 by <a href="https://github.com/intuezy">intuezy</a>
</div>
