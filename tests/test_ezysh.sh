#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BIN="$DIR/bin/ezysh"

echo "🧪 Running ezysh Automated Test Suite..."

# Test 1: Version flag
echo -n "  [1/6] Testing --version flag... "
$BIN --version | grep -q "ezysh v"
echo "✔ Passed"

# Test 2: Help flag
echo -n "  [2/6] Testing --help flag... "
$BIN --help | grep -q "Usage: ezysh"
echo "✔ Passed"

# Test 3: Sync flag
echo -n "  [3/6] Testing --sync flag... "
$BIN --sync | grep -q "Successfully synced"
echo "✔ Passed"

# Test 4: List flag
echo -n "  [4/6] Testing --list flag... "
count=$($BIN --list | wc -l)
if [ "$count" -lt 100 ]; then
    echo "❌ Failed: Command database is too small ($count)"
    exit 1
fi
echo "✔ Passed ($count commands indexed)"

# Test 5: Quick Add flag
echo -n "  [5/6] Testing --add flag... "
$BIN --add "test-ci-cmd" "echo 'CI Test'" "Automated test command" "CI" | grep -q "Successfully added"
$BIN --list | grep -q "test-ci-cmd"
# Clean up
sed -i '/test-ci-cmd/d' "${XDG_CONFIG_HOME:-$HOME/.config}/ezysh/custom.tsv"
$BIN --sync >/dev/null
echo "✔ Passed"

# Test 6: Preview line safe renderer
echo -n "  [6/6] Testing --preview-line renderer... "
$BIN --preview-line 1 | grep -q "CATEGORY"
$BIN --preview-line 2 | grep -q "COMMAND"
echo "✔ Passed"

echo -e "\n🎉 \033[1;32mAll ezysh tests passed flawlessly!\033[0m"
