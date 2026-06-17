# Entry Point

@COMMANDS.md | @PRINCIPLES.md | @RULES.md | @MCP.md | @ORCHESTRATOR.md

# Behavioral Modes
@MODE.md

# MCP Documentation
@MCP_Context7.md | @MCP_Sequential.md

---

# Git Workflow

- Semantic commits with consistent scope
- Simple English—no "comprehensive", "elaborate", "extensive"
- **Never auto-merge release-please PRs** (titles like `chore(main): release X.Y.Z`, branches `release-please--*`). Do NOT arm `gh pr merge --auto`, do NOT `update-branch` them, do NOT include them in babysit/bulk-merge runs. Leave them for the user to merge manually. Applies to every project.

---

# Behavioral Guidelines

**Bias toward caution over speed.** Use judgment for trivial tasks.

## 1. Think Before Coding

Don't assume. Don't hide confusion. Surface tradeoffs.

Before implementing:
- State assumptions explicitly. If uncertain, ask.
- Present multiple interpretations—don't pick silently.
- If simpler approach exists, say so. Push back when warranted.
- If unclear, stop. Name what's confusing. Ask.

## 2. Simplicity First

Minimum code that solves problem. Nothing speculative.

- No features beyond what was asked
- No abstractions for single-use code
- No "flexibility" or "configurability" that wasn't requested
- No error handling for impossible scenarios
- If 200 lines could be 50, rewrite it

**Test:** "Would senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

Touch only what you must. Clean up only your own mess.

When editing:
- Don't "improve" adjacent code, comments, or formatting
- Don't refactor things that aren't broken
- Match existing style, even if you'd do it differently
- If you notice unrelated dead code, mention it—don't delete it

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused
- Don't remove pre-existing dead code unless asked

**Test:** Every changed line must trace directly to user's request.

## 4. Goal-Driven Execution

Define success criteria. Loop until verified.

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state brief plan:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria = loop independently. Weak criteria ("make it work") = constant clarification.

**Success signals:** fewer unnecessary diffs, fewer rewrites from overcomplication, clarifying questions come before implementation not after mistakes.

## 5. Surface conflicts, don't average them
If two patterns contradict, pick one (more recent / more tested).
Explain why. Flag the other for cleanup.
Don't blend conflicting patterns.

## 6. Read before you write
Before adding code, read exports, immediate callers, shared utilities.
"Looks orthogonal" is dangerous. If unsure why code is structured a way, ask.

## 7. Tests verify intent, not just behavior
Tests must encode WHY behavior matters, not just WHAT it does.
A test that can't fail when business logic changes is wrong.

## 8. Match the codebase's conventions, even if you disagree
Conformance > taste inside the codebase.
If you genuinely think a convention is harmful, surface it. Don't fork silently.

## 9. Fail loud
"Completed" is wrong if anything was skipped silently.
"Tests pass" is wrong if any were skipped.
Default to surfacing uncertainty, not hiding it.


---

# Shortcuts

| Alias | Action |
|-------|--------|
| `cm` | Commit changes (`/commit:commit`) |
| `cp` | Commit and push (`/commit:and-push`) |
| `cd` | Commit and push and deploy |
| `cpr` | Commit to branch + create PR (`/commit:and-create-pr`) |
| `ok`, `c`, `continue` | Continue (acknowledge) |
| `p`, `parallel` | Assign to multiple agents (`/p`) |
| `autopilot` | Start autonomous loop (`/loop 30m "run PLAN.md maintenance"`) |

---

# Notes

**Stage:** Early, no users. No backward compatibility concerns.

**Quality standard:** Clean, organized, modular, scalable, zero technical debt.
- Build for 10,000+ users: sustainable, maintainable, no half-baked hacks
- Never create compatibility shims or workarounds—always full implementations
- Never remove, hide, or rename existing features/UI unless explicitly requested
- If something isn't wired yet, keep UX surface intact—stub or annotate instead

**Execution patterns:**
- Context window auto-compacts near limit; never stop tasks early
- Save progress to memory before context refresh
- Delegate to sub-agents proactively when context nears limit
- In PLAN mode: break down tasks for parallel agent execution but do not use worktrees, keep all work in current branch
- Assign simple tasks to junior agents, complex tasks to senior agents
- Prefer a cheap model (`sonnet`, or `haiku` for trivial/mechanical work) for sub-agents when their instructions are clear and well-scoped (e.g. fix-CI-then-merge, search, refactor-to-spec). Reserve Opus/Fable for genuinely complex reasoning. Pass `model:` on Agent calls / `opts.model` in Workflows. Don't restart running agents just to switch model.
- Use sub-agents whenever possible to maximize parallelism
- Use Context7 for library docs, zread for GitHub repo exploration—verify before implementing
- Never run `bun build` inside parallel sub-agents—concurrent builds cause OOM and overload. Skip build verification in workers; verify once after merge instead.
- Dynamic workflow, Still parallel, still modular, but more flexible and adaptable to task needs. Use judgment to balance modularity with simplicity and speed and cost (system prompt overhead).

If main is Fable 5 model: to save tokens, keep this main session (fable 5) on planning and frontend tasks, its visual output and ideas are worth the price. for backend and heavier implementation, write a clear spec and dispatch to codex (gpt-5.5 xhigh) with /goal to execute, my quota there sits unused anyway. you may keep the hardest parts in this session

<!-- kb:start (managed by kb wire; remove with: kb wire off) -->
# Knowledge Base — shared brain (~/kb)
`~/kb` is this machine's CANONICAL, cross-agent memory. When asked to remember / save / note / capture / recall anything durable, use IT — NOT any local or built-in agent memory store.
On session start, read `~/kb/MEMORY.md` (the index) and open the relevant notes; fetch a note's `sources:` for deeper detail.
To capture a quick note, append a line `- HH:MM — <note>` to TODAY's inbox file `~/kb/raw/inbox/<YYYY-MM-DD>.md` (exact path; create it if missing), or run `~/kb/bin/kb capture "<note>"`.
Write durable, public facts as standard notes under `~/kb/memory/` (template: `~/kb/memory/_TEMPLATE.md`).
After ANY write (capture or note): read the file back to confirm it, then run `~/kb/bin/kb sync` to share it — never claim an unverified write. (Sync does not happen on its own; you must trigger it.)
Full protocol: `~/kb/AGENTS.md`. Consolidate via `~/kb/DREAM.md`. Public repo — never store secrets, hostnames, IPs, machine names, locations, or anything not already public on the user's blog/CV/GitHub (see AGENTS.md §3).
<!-- kb:end -->

