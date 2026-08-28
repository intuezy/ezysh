# Contributing to ezysh ⚡

First off, thank you for considering contributing to **ezysh**! Projects like this thrive because of the open-source community.

Whether you want to add new curated command recipes, fix a bug, or improve documentation, your help is warmly welcomed.

---

## 🌟 How Can You Contribute?

1. **Propose New Curated Commands & Recipes** (Easiest & Most Impactful!)
2. **Report Bugs & Edge Cases**
3. **Suggest New Shell Integrations / Themes**
4. **Improve Documentation & Translations**

---

## 📐 Guidelines for Adding Curated Commands

We maintain a high bar for built-in default commands:
- **High Utility**: Must be commands that developers, sysadmins, or power users actually reach for in production or daily workflows. Avoid trivial single-flag commands that are already easy to remember (e.g. `ls -l`).
- **Interactive Placeholders**: If the command expects arguments (such as a port, domain, branch name, or PID), format them cleanly with `<placeholder>` notation (e.g. `<port>`, `<domain>`, `<url>`, `<branch>`).
- **Consistent Naming**:
  - Use lowercase hyphenated triggers: `port-who <port>`, `docker-clean-all`, `prisma-migrate <name>`.
  - Multi-step / pipeline workflows should be prefixed with `case-`: `case-kill-port <port>`, `case-top-connected-ips`.
- **Descriptive Explanations**: Write clear, actionable descriptions explaining *what* the command does and *why* you would use it.

---

## 🛠️ Local Development & Testing

1. **Fork and clone the repository**:
   ```bash
   git clone https://github.com/<your-username>/ezysh.git
   cd ezysh
   ```

2. **Make your changes** in `bin/ezysh` or plugin files.

3. **Run the automated test suite**:
   ```bash
   bash ./tests/test_ezysh.sh
   ```

4. **Verify your shell locally**:
   ```bash
   ./bin/ezysh --sync
   ./bin/ezysh
   ```

---

## 🚀 Pull Request Process

1. Create a descriptive branch for your feature/fix:
   ```bash
   git checkout -b feat/add-kubernetes-suite
   ```
2. Commit your changes following conventional commits (`feat: ...`, `fix: ...`, `docs: ...`).
3. Ensure the test suite passes (`bash ./tests/test_ezysh.sh`).
4. Push to your fork and open a Pull Request against `main`.

Thank you for helping make `ezysh` the best command palette for the terminal! 🚀
