# Orchestration Mode

**Purpose**: Intelligent tool selection and parallel execution for optimal task routing.

## Activation Triggers
- Multi-tool operations requiring coordination
- Parallel execution opportunities (3+ independent subtasks)
- Complex routing decisions with multiple valid approaches
- Context window nearing limits

## Tool Selection Matrix

| Task Type | Best Tool | Alternative |
|-----------|-----------|-------------|
| Find files by pattern | Glob | Bash (find) |
| Search file contents | Grep | Agent (Explore) |
| Broad codebase exploration | Agent (Explore) | Multiple Grep/Glob |
| Library/framework docs | Context7 MCP | WebSearch → WebFetch |
| GitHub repo exploration | zread MCP | WebFetch |
| Multi-file refactoring | Agent (team-agents:senior-engineer) | Sequential Edit |
| Architecture planning | Agent (Plan) | Manual analysis |
| Complex implementation | Agent (team-agents:leader) | Agent (senior-engineer) |
| Simple targeted tasks | Agent (team-agents:junior-engineer) | Direct Edit |
| Code review | Agent (feature-dev:code-reviewer) | Manual Read |
| Feature architecture | Agent (feature-dev:code-architect) | Agent (Plan) |
| Codebase understanding | Agent (feature-dev:code-explorer) | Agent (Explore) |
| Web research | WebSearch | WebFetch |
| Test execution | Bash | Agent (background) |
| Infrastructure config | WebFetch (official docs first) | Context7 MCP |

## Parallel Execution Strategy

### When to Parallelize
- 3+ independent file reads or searches
- Multiple Agent tasks with no dependencies
- Independent research queries
- Test suite + lint + typecheck

### How to Parallelize
- **Same message**: Multiple tool calls in one response
- **Agent background**: `run_in_background: true` for independent work
- **Agent worktree**: `isolation: "worktree"` for isolated code changes
- **Team agents**: Use `team-agents:leader` to coordinate parallel workstreams

### Dependency Ordering
- Sequential when output of step N feeds into step N+1
- Parallel when steps are independent
- Mixed: start independent tasks first, then chain dependent ones

## Infrastructure Configuration Rules

**Critical**: Infrastructure and config changes MUST consult official documentation first.

- **Keywords**: Traefik, nginx, Docker, Kubernetes, Terraform, etc.
- **Process**: WebFetch official docs → verify syntax → implement
- **Never**: Assume config syntax from memory alone

## Context Window Management

### Green Zone (plenty of context)
- Full capabilities, normal verbosity
- Use all tools freely

### Yellow Zone (context getting large)
- Delegate complex subtasks to Agent (preserves main context)
- Save progress to memory directory
- Reduce verbosity in responses

### Red Zone (context near limit)
- Save all progress to memory immediately
- Delegate remaining work to agents
- Use token efficiency symbols
