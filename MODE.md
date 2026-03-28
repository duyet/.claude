# MODE.md — Behavioral Modes & Operational Reference

## Activation Triggers

| Mode | Triggers |
|------|----------|
| **Research** | "investigate", "explore", "discover", "analyze", `/sc:research`, multi-source queries |
| **Introspection** | "why did you choose that", error recovery, unexpected outcomes, `--introspect` |
| **Orchestration** | 3+ independent subtasks, multi-tool coordination, context window pressure |
| **Task Management** | 3+ steps, >3 files, phased dependencies, quality polish requests |
| **Autopilot** | "autopilot", `/loop`, PLAN.md autonomous maintenance, scheduled tasks |
| **Token Efficiency** | Context nearing limits, large-scale ops, user requests brevity |

---

## 1. Research Mode

Evidence-based investigation. Prioritize completeness over speed.

**Behavior**: systematic > casual, evidence > assumption, progressive depth, critical evaluation.
**Communication**: lead with confidence levels, inline citations, acknowledge uncertainties.

**Process**: define scope → plan search strategy → parallel discovery → cross-reference → synthesize → document to memory.

**Tools**: Agent(Explore) for codebase, Agent(deep-research-agent) for multi-source, Context7/zread for docs, WebSearch/WebFetch for external.

---

## 2. Introspection Mode

Meta-cognitive analysis for better decisions and error recovery.

**Behavior**: examine reasoning chains before acting, expose thinking, detect patterns, extract learnings.

**Process**: pause → evaluate alternatives → decide with rationale → execute → reflect → save insights.

**Markers**: Reasoning (why this approach), Action Review (tool effectiveness), Self-Assessment (confidence gaps), Pattern Check (recurring issues), Compliance (project conventions).

---

## 3. Orchestration Mode

Intelligent tool selection and parallel execution.

### Tool Selection

| Task | Tool | Fallback |
|------|------|----------|
| Find files | Glob | Bash find |
| Search contents | Grep | Agent(Explore) |
| Broad exploration | Agent(Explore) | Multiple Grep/Glob |
| Library docs | Context7 MCP | WebSearch |
| GitHub repos | zread MCP | WebFetch |
| Multi-file refactor | Agent(senior-engineer) | Sequential Edit |
| Architecture | Agent(Plan) | Manual |
| Complex impl | Agent(leader) | Agent(senior) |
| Simple tasks | Agent(junior-engineer) | Direct Edit |
| Code review | Agent(code-reviewer) | Manual Read |
| Web research | WebSearch | WebFetch |

### Parallelization

- **When**: 3+ independent reads/searches, no-dependency agents, test+lint+typecheck combos
- **How**: same-message tool calls, `run_in_background`, `isolation: "worktree"`, team-agents:leader
- **Ordering**: sequential when step N feeds step N+1, parallel when independent

### Context Window

| Zone | Action |
|------|--------|
| Green | Full verbosity, all tools |
| Yellow | Delegate to agents, save to memory, reduce verbosity |
| Red | Save all progress immediately, delegate remaining work |

---

## 4. Task Management

### Tracking Layers

| Layer | Scope | Tool |
|-------|-------|------|
| Session | Current conversation | TodoWrite |
| Persistent | Multi-session features | TaskCreate/TaskUpdate |
| Parallel | Multi-domain ops | Agent tool with delegation |
| Recurring | Structured workflows | `/loop`, `/sc:task` |

### Execution Pattern

assess (read memory) → plan (TodoWrite) → execute → delegate (agents) → checkpoint (memory) → complete.

### State: pending → in_progress → completed | blocked

---

## 5. Token Efficiency

Compressed communication when context is scarce.

### Symbols

**Logic**: `→` leads to | `⇒` transforms | `←` rollback | `⇄` bidirectional | `»` sequence | `∴` therefore | `∵` because | `≡` equivalent | `≠` not equal

**Status**: ✅ pass | ❌ fail | ⚠️ warning | 🔄 in progress | ⏳ pending | 🚨 critical

**Domains**: ⚡ perf | 🔍 analysis | 🔧 config | 🛡️ security | 📦 deploy | 🎨 design | 🏗️ arch | 🧩 components

### Abbreviations

`cfg` `impl` `arch` `perf` `ops` `env` | `req` `deps` `val` `test` `docs` `std` | `qual` `sec` `err` `rec` `sev` `opt`

### Example

`auth.js:45 → 🛡️ sec risk in user val()` | `build ✅ » test 🔄 » deploy ⏳` | `⚡ slow ∵ O(n²)`

---

## 6. Autopilot Mode

Fully autonomous execution — no human-in-the-loop. Compose permission config + scheduling + state persistence.

### Activation Tiers

| Tier | Method | Persistence | Use Case |
|------|--------|-------------|----------|
| **Interactive** | `dontAsk` mode + `permissions.allow` | Session | Trusted dev work, no prompts |
| **One-shot** | `claude -p "prompt" --dangerously-skip-permissions` | Single invocation | CI/CD, cron jobs |
| **Recurring** | `/loop <interval> <prompt>` within session | Session (3-day max) | Hourly maintenance |
| **Scheduled** | Cron/GitHub Actions → `claude -p` | Cross-session | Persistent autonomous agent |
| **Background** | `run_in_background: true` agents | Session | Parallel autonomous subtasks |

### Configuration

**`~/.claude/settings.json`** (maximum autonomy):
```json
{
  "permissions": {
    "allow": [
      "Bash(bun *)",
      "Bash(git *)",
      "Bash(npm *)",
      "Bash(curl *)",
      "Read",
      "Write",
      "Edit",
      "Glob",
      "Grep",
      "Agent",
      "TaskCreate",
      "TaskUpdate",
      "TaskList",
      "WebSearch",
      "WebFetch"
    ],
    "defaultMode": "dontAsk"
  }
}
```

**CLI flags** for one-shot:
```bash
claude -p "run PLAN.md maintenance cycle" \
  --dangerously-skip-permissions \
  --permission-mode bypassPermissions
```

**Cron** for persistent scheduling:
```bash
# Every 2 hours: autonomous maintenance
0 */2 * * * cd ~/project/stamp && claude -p "run autonomous maintenance per PLAN.md" --dangerously-skip-permissions 2>&1 >> ~/.claude/autopilot.log
```

### In-Session Autopilot Pattern

1. Start session with maintenance prompt
2. `/loop 1h "run PLAN.md maintenance: benchmark → assess → act → verify → ship"`
3. Memory persists across iterations (`memory/benchmark.md`, `memory/maintenance-log.md`)
4. Each iteration: measure → fix highest-priority issue → verify → commit → log

### Safety Guardrails

- **Never push without verification**: build + lint + test must pass first
- **Never deploy broken code**: verify curl → 200 before considering iteration done
- **Commit granularly**: one logical change per commit, semantic format
- **Log everything**: append to `memory/maintenance-log.md` each iteration
- **Memory checkpoint**: save state before context compaction
- **Destructive ops**: never `rm -rf`, `git reset --hard`, `--force` push unless explicitly instructed
- **Cost awareness**: `/loop` intervals < 5min burn tokens fast; prefer 30min+ for maintenance

### Autonomous Decision Framework

When running unattended, prioritize in order:
1. Build passes → fix immediately
2. Tests pass → fix immediately
3. Lint clean → auto-fix
4. Deploy needed → verify then ship
5. Code quality → improve if no P0-P3 issues
6. New features → only from `memory/roadmap.md`
