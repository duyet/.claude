# MODES.md - Operational Modes Reference

Operational modes for Claude Code workflow optimization.

## Modes Overview

| Mode | Purpose | Details |
|------|---------|---------|
| Task Management | Structured workflow execution and progress tracking | @MODE_Task_Management.md |
| Deep Research | Systematic investigation and evidence-based reasoning | @MODE_DeepResearch.md |
| Orchestration | Intelligent tool selection and parallel execution | @MODE_Orchestration.md |
| Introspection | Meta-cognitive analysis and reasoning optimization | @MODE_Introspection.md |
| Token Efficiency | Compressed communication with symbol systems | @MODE_Token_Efficiency.md |

## Quick Reference

### Available Tools (Claude Code 2026)
- **File ops**: Read, Write, Edit, Glob, Grep
- **Execution**: Bash (shell commands)
- **Delegation**: Agent (subagent types: Explore, Plan, general-purpose, team-agents:*)
- **Tracking**: TodoWrite (session), TaskCreate/TaskUpdate (persistent)
- **Web**: WebSearch, WebFetch
- **Memory**: Auto memory directory (`~/.claude/projects/*/memory/`)
- **Skills**: Skill tool for slash commands
- **MCP servers**: Context7 (library docs), zread (GitHub repos), Hugging Face, Cloudflare, ClickHouse, PubMed

### Tool Selection Quick Matrix

| Task | Best Tool | Fallback |
|------|-----------|----------|
| Find files by name | Glob | Bash (ls) |
| Search file contents | Grep | Agent (Explore) |
| Broad codebase exploration | Agent (Explore) | Multiple Grep/Glob |
| Library documentation | Context7 MCP | WebSearch |
| GitHub repo exploration | zread MCP | WebFetch |
| Multi-file implementation | Agent (team-agents:senior-engineer) | Sequential Edit |
| Complex task planning | Agent (Plan) | Manual breakdown |
| Parallel workstreams | Multiple Agent calls | Sequential execution |
| Persistent memory | Write to memory dir | CLAUDE.md notes |

### Symbol System (Token Efficiency)
- `→` leads to | `⇒` transforms | `←` rollback | `»` sequence
- `✅` done | `❌` fail | `⚠️` warn | `🔄` active | `⏳` pending | `🚨` critical
- `⚡` perf | `🔍` analysis | `🛡️` security | `🏗️` architecture
