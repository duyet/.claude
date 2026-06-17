#!/usr/bin/env bash
# sync-memory.sh — sync & merge Claude's per-project auto-memory across machines.
#
# Scope: ONLY ~/.claude/projects/*/memory/**/*.md  (the durable memory store).
# Everything else under projects/ (session transcripts, locks) is left alone.
#
# Mechanism: a DEDICATED, independent git repo (its own --git-dir at
# .memory.git) whose work-tree is ~/.claude. It coexists with the main .claude
# config repo without either seeing the other's files. It tracks only memory
# markdown, uses union-merge so concurrent edits never block a rebase, and does
# the same safe dance kb uses:
#   pull --rebase --autostash  →  add memory  →  commit  →  push.
#
# Idempotent. Safe to run by hand, from cron, or from a hook.
# Requires a PRIVATE remote (memory contains infra/SSH/namespace details).
set -euo pipefail

CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
GIT_DIR="$CLAUDE_DIR/.memory.git"
REMOTE="${CLAUDE_MEMORY_REMOTE:-git@github.com:duyet/claude-memory.git}"
BRANCH="main"

g() { git --git-dir="$GIT_DIR" --work-tree="$CLAUDE_DIR" "$@"; }

cd "$CLAUDE_DIR"

# --- first-run bootstrap (independent git-dir; never touches .claude/.git) ---
if [ ! -d "$GIT_DIR" ]; then
  echo "[memory-sync] bootstrapping repo at $GIT_DIR"
  git --git-dir="$GIT_DIR" init -q -b "$BRANCH"
  g config core.bare false
  g config core.worktree "$CLAUDE_DIR"
  g remote add origin "$REMOTE"
fi

# --- union-merge + ignore rules (git-dir-local, invisible to main repo) ------
mkdir -p "$GIT_DIR/info"
cat > "$GIT_DIR/info/attributes" <<'EOF'
projects/**/memory/**/*.md merge=union
projects/**/memory/*.md     merge=union
EOF
# Ignore everything except memory markdown so a stray add can't slurp secrets.
cat > "$GIT_DIR/info/exclude" <<'EOF'
/*
!/projects/
/projects/*
!/projects/*/
/projects/*/*
!/projects/*/memory/
/projects/*/memory/.consolidate-lock
/projects/*/memory/*.lock
EOF

# --- pull first (rebase onto remote, stash any in-flight edits) --------------
if g ls-remote --exit-code origin "$BRANCH" >/dev/null 2>&1; then
  g pull --rebase --autostash origin "$BRANCH" || {
    echo "[memory-sync] rebase hit a conflict union-merge couldn't resolve."
    echo "[memory-sync] resolve under $CLAUDE_DIR, then:"
    echo "  git --git-dir=$GIT_DIR --work-tree=$CLAUDE_DIR rebase --continue"
    exit 1
  }
fi

# --- stage only memory markdown (bash 3.2 compatible: find -exec) ------------
find projects -type f -path '*/memory/*.md' \
  -exec git --git-dir="$GIT_DIR" --work-tree="$CLAUDE_DIR" add -f -- {} +
g add -u   # tracked set is memory-only, so this just stages deletions

# --- commit & push -----------------------------------------------------------
if ! g diff --cached --quiet; then
  host="$(hostname -s 2>/dev/null || echo machine)"
  g commit -q -m "memory: auto-sync from $host"
  echo "[memory-sync] committed local changes"
fi
g push -u origin "$BRANCH"
echo "[memory-sync] done"
