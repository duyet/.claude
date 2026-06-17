#!/usr/bin/env bash
# sync-config.sh — keep ~/.claude config (CLAUDE.md, MODE.md, agents, scripts,
# commands) in sync with the duyet/.claude remote. Tracked set is controlled by
# .claude/.gitignore (secrets, sessions, caches, projects/ are excluded).
#
# Same safe dance as kb: pull --rebase --autostash → commit tracked → push.
set -euo pipefail

CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
cd "$CLAUDE_DIR"
BRANCH="$(git rev-parse --abbrev-ref HEAD)"

git pull --rebase --autostash origin "$BRANCH" || {
  echo "[config-sync] conflict — resolve in $CLAUDE_DIR then: git rebase --continue"; exit 1; }

# Stage only already-tracked changes; never auto-add new untracked files
# (avoids accidentally committing a new secret the .gitignore doesn't know yet).
git add -u
if ! git diff --cached --quiet; then
  git commit -q -m "chore: auto-sync config from $(hostname -s 2>/dev/null || echo machine)"
  echo "[config-sync] committed local changes"
fi
git push origin "$BRANCH"
echo "[config-sync] done"
