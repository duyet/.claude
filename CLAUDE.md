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

---

# Shortcuts

| Alias | Action |
|-------|--------|
| `cm` | Commit changes (`/commit:commit`) |
| `cp` | Commit and push (`/commit:and-push`) |
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
- Use sub-agents whenever possible to maximize parallelism
- Use Context7 for library docs, zread for GitHub repo exploration—verify before implementing
- Never run `bun build` inside parallel sub-agents—concurrent builds cause OOM and overload. Skip build verification in workers; verify once after merge instead.
