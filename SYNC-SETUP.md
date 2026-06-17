# Cross-machine sync for Claude (mac ⇄ duet-ubuntu)

Three independent, conflict-safe git loops. Each does the same dance kb uses:
`pull --rebase --autostash → commit → push`. All run from cron every 15–30 min.

| Layer | Repo | Script | What it carries | Cron |
|-------|------|--------|-----------------|------|
| **Shared brain** | `duyet/kb` (public) | `kb autosync` | durable cross-agent notes | */15 |
| **Config** | `duyet/.claude` (public) | `sync-config.sh` | CLAUDE.md, MODE.md, agents, commands, the sync scripts themselves | */30 |
| **Auto-memory** | `duyet/claude-memory` (**private**) | `sync-memory.sh` | `projects/*/memory/**/*.md` only | */15 |

## Design notes
- **Auto-memory repo is private** — memory holds infra/SSH/namespace/ClickHouse
  details. Never make it public.
- **Scope is surgical.** `sync-memory.sh` uses a *dedicated* git-dir at
  `~/.claude/.memory.git` (separate from `~/.claude/.git`) and only ever stages
  `projects/*/memory/**/*.md`. Session transcripts, caches, locks, and secrets
  are never touched. The main config repo gitignores `.memory.git/` and
  `projects/`, so the two repos coexist on the same dir without collision.
- **Merge strategy = union.** `.memory.git/info/attributes` sets
  `merge=union` on memory markdown, so concurrent edits on two machines keep
  *both* sides' lines instead of halting the rebase. Memory is append-mostly so
  this is near-lossless; occasional duplicate lines get cleaned by a
  dream/consolidate pass.
- **Config sync only stages tracked files** (`git add -u`) — it never
  auto-adds a new untracked file, so a stray secret can't sneak into the public
  config repo.

## One-time setup on duet-ubuntu

Prereqs: `git`, an SSH key on the box added to GitHub, Claude Code installed
(so `~/.claude` exists).

```bash
# 1. Attach ~/.claude to the config remote (pulls CLAUDE.md, scripts, etc.)
cd ~/.claude
git init -q
git remote add origin git@github.com:duyet/.claude.git
git fetch origin
git checkout -f -b master origin/master   # remote wins for TRACKED config only;
                                          # gitignored local state is preserved

# 2. Bootstrap + first sync of the private memory repo
chmod +x sync-memory.sh sync-config.sh
./sync-memory.sh        # clones duyet/claude-memory into .memory.git, merges

# 3. kb shared brain (if not already cloned on this box)
#    clone duyet/kb to wherever KB_DIR points, then:
~/kb/bin/kb autosync on

# 4. Install the cron loops
( crontab -l 2>/dev/null | grep -vE 'sync-memory\.sh|sync-config\.sh';
  echo "*/15 * * * * $HOME/.claude/sync-memory.sh >> \$HOME/.claude-memory-sync.log 2>&1";
  echo "*/30 * * * * $HOME/.claude/sync-config.sh >> \$HOME/.claude-config-sync.log 2>&1"
) | crontab -
```

That's it — both machines now converge every 15–30 min.

## Manual sync (any machine)
```bash
~/.claude/sync-memory.sh    # memory
~/.claude/sync-config.sh    # config
~/kb/bin/kb sync            # shared brain
```

## If a rebase ever conflicts
union-merge makes this rare. If it happens:
```bash
cd ~/.claude
git --git-dir=.memory.git --work-tree=. status   # see the conflict
# edit the file, then:
git --git-dir=.memory.git --work-tree=. add <file>
git --git-dir=.memory.git --work-tree=. rebase --continue
```

## Logs
- `~/.claude-memory-sync.log`, `~/.claude-config-sync.log`, `~/.kb-sync.log`
