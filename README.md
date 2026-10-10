# ezysh

A terminal command palette for the commands and flags you always forget.

Hit `Ctrl + K`, type what you want to do in plain English or Indonesian, and get the exact command pasted into your prompt.

<p align="center">
  <img src="assets/demo.gif" alt="ezysh demo" width="100%" />
</p>

---

## The Problem

You know what you want to do:
- *"Kill whatever is hogging port 3000"*
- *"Undo my last git commit without losing my work"*
- *"Clean up 40 GB of Docker cache and dangling images"*
- *"Rescue a deleted file that is still held in memory"*

You just don't remember `lsof -ti:3000 | xargs kill -9` or `git reset --soft HEAD~1`.

Instead of opening a browser to search StackOverflow or documentation for the tenth time, press `Ctrl + K`.

---

## Quickstart

### Requirements
- `fzf`
- `bash` (4.0+)
- Shell: `zsh`, `bash`, or `fish`

### Install (One-Liner)

```bash
curl -fsSL https://raw.githubusercontent.com/intuezy/ezysh/main/install.sh | bash
```

Restart your terminal, then press **`Ctrl + K`** (or run `ezy`).

---

## Manual Installation

### Zsh
```bash
git clone https://github.com/intuezy/ezysh.git ~/.ezysh
echo "source ~/.ezysh/ezysh.plugin.zsh" >> ~/.zshrc
source ~/.zshrc
```

### Bash
```bash
git clone https://github.com/intuezy/ezysh.git ~/.ezysh
echo "source ~/.ezysh/ezysh.plugin.bash" >> ~/.bashrc
source ~/.bashrc
```

### Fish
```bash
git clone https://github.com/intuezy/ezysh.git ~/.ezysh
ln -s ~/.ezysh/ezysh.fish ~/.config/fish/conf.d/ezysh.fish
```

---

## How It Works

1. **Search by Intent**: Fuzzy search matches against command names, syntax, and natural language descriptions. Typing `kill port`, `free memory`, or `undo` finds the right command immediately.
2. **Interactive Parameters**: Commands with placeholders (like `<port>` or `<container>`) prompt you for values before inserting the command.
3. **Safe by Default**: Nothing runs blindly. `ezysh` pastes the completed command into your shell buffer so you can inspect or tweak it before hitting `Enter`.
4. **Save What You Forget**: Found a command you know you will forget next week? Save it on the fly:
   ```bash
   ezy -a "flush-dns" "sudo resolvectl flush-caches" "Flush local DNS cache" "Network"
   ```
   Stored as plain tab-separated text in `~/.config/ezysh/custom.tsv`.

---

## Daily Usage

| Key / Command | Action |
| :--- | :--- |
| `Ctrl + K` | Open command palette |
| `ezy` | Open command palette from shell |
| `ezy -a <name> <cmd> <desc> [cat]` | Save a custom command |
| `ezy -e` | Edit custom commands (`~/.config/ezysh/custom.tsv`) |
| `ezy -s` | Re-index commands |
| `ezy -l` | Print all commands to stdout |

---

## Built-in Commands

`ezysh` includes 200+ curated built-in commands across daily developer workflows:

- **Docker & Compose**: Service controls, restart policies, container shells, system purges.
- **Git**: Undoing commits, stash salvage, amending history, branch cleanups.
- **Networking**: Port killing, reverse SSH tunnels, SOCKS proxies, SSL expiry checks.
- **Linux & System**: Space hogs locator, journald error filters, file/dir permissions, process inspection.
- **Dev Stacks**: Node.js, Go, Rust, Python, PostgreSQL, Redis.

All default commands live in `share/defaults.tsv` as clean, tab-separated text.

---

## Custom Themes

To customize colors, create or edit `~/.config/ezysh/theme.sh`:

```bash
export EZYSH_FZF_COLORS="bg:#1f1f1f,bg+:#353535,fg:#c7c7c7,fg+:#dedede,hl:#999999,border:#3d3d3d"
```

---

## License

MIT © 2026 [intuezy](https://github.com/intuezy)
