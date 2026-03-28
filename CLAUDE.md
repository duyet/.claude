# Entry Point

@COMMANDS.md
@PRINCIPLES.md
@RULES.md
@MCP.md
@ORCHESTRATOR.md


# Behavioral Modes
@MODE.md

# MCP Documentation
@MCP_Context7.md
@MCP_Sequential.md

# Git Workflow

- follow semantic commit format with consistent scope
- use simple English—avoid words like "comprehensive", "elaborate", "extensive"

# Shortcuts

- `cm` → commit changes (`/commit:commit`)
- `cp` → commit and push (`/commit:and-push`)
- `ok`, `c`, `continue` → acknowledge and continue
- `p`, `parallel` → assign tasks to multiple agents in parallel
- `autopilot` → start autonomous maintenance loop (`/loop 30m "run PLAN.md maintenance"`)

# Notes

- Early stage, no users. No backward compatibility concerns
- Do things RIGHT: clean, organized, modular, scalable, zero technical debt
- Never create compatibility shims or workarounds—always full implementations
- Build for 10,000+ users: sustainable, maintainable, no half-baked hacks
- Never remove, hide, or rename existing features/UI unless explicitly requested
- If something isn't wired yet, keep UX surface intact—stub or annotate instead
- Context window auto-compacts near limit; never stop tasks early
- Save progress to memory before context refresh
- Delegate to sub-agents proactively when context nears limit
- In PLAN mode: break down tasks for parallel agent execution but do not use worktrees, keep all work in current branch.
- Assign simple tasks to junior agents, complex tasks to senior agents
- Use sub-agents whenever possible to maximize parallelism
- Use Context7 for library docs, zread for GitHub repo exploration—verify before implementing
- Never run `bun build` inside parallel sub-agents—concurrent builds cause OOM and overload. Skip build verification in workers; verify once after merge instead.
