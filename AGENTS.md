# AGENTS.md — global agent instructions

These apply to every coding agent on this machine (Codex, Hermes, OpenClaw, and
any tool that reads `AGENTS.md`).

## Knowledge Base (KB) — Shared Brain

`~/kb` is the **root source of truth** for cross-session, cross-tool,
cross-repo memory. It is a **public** git repo — never write secrets, API keys,
SSH hosts, internal IPs, or employer-confidential facts there.

**On session start:** read `~/kb/MEMORY.md` (the index), then open only
the notes whose one-line hook is relevant to the current task. Don't bulk-read.

**When you learn a durable, general, public fact** a future agent (any tool, any
repo) would benefit from:
1. Add an atomic note to `~/kb/memory/<type>-<slug>.md` with top-level frontmatter
   (`name`, `description`, `type` ∈ user|feedback|project|reference|tech, `tags`,
   `created`, `updated`; optional `title`/`category`/`aliases`/`related`). Link
   related notes with `[[slug]]` for the Obsidian graph. Full spec: `~/kb/AGENTS.md`.
2. Update an existing note instead of duplicating.
3. Add a one-line pointer in `~/kb/MEMORY.md`.
4. `cd ~/kb && git add -A && git commit -m "memory: <what>" && git push`.

**Consolidate** periodically using `~/kb/DREAM.md` (dedupe, merge,
re-file, rebuild the index).

The full protocol — read rules, write rules, frontmatter spec, scope limits, and
the dream pass — is in `~/kb/AGENTS.md`. Read it once on a new device.

If `~/kb` is missing on this device:
`git clone git@github.com:duyet/kb.git ~/kb`.

<!-- kb:start (managed by kb wire; remove with: kb wire off) -->
# Knowledge Base — shared brain (~/kb)
`~/kb` is this machine's CANONICAL, cross-agent memory. When asked to remember / save / note / capture / recall anything durable, use IT — NOT any local or built-in agent memory store.
On session start, read `~/kb/MEMORY.md` (the index) and open the relevant notes; fetch a note's `sources:` for deeper detail.
To capture a quick note, append a line `- HH:MM — <note>` to TODAY's inbox file `~/kb/raw/inbox/<YYYY-MM-DD>.md` (exact path; create it if missing), or run `~/kb/bin/kb capture "<note>"`.
Write durable, public facts as standard notes under `~/kb/memory/` (template: `~/kb/memory/_TEMPLATE.md`).
After ANY write (capture or note): read the file back to confirm it, then run `~/kb/bin/kb sync` to share it — never claim an unverified write. (Sync does not happen on its own; you must trigger it.)
Full protocol: `~/kb/AGENTS.md`. Consolidate via `~/kb/DREAM.md`. Public repo — never store secrets, hostnames, IPs, machine names, locations, or anything not already public on the user's blog/CV/GitHub (see AGENTS.md §3).
<!-- kb:end -->
