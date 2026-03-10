# duyet's `.claude` setup

My `.claude` configuration for Claude Code.

## Core Components

- [**CLAUDE.md**](CLAUDE.md) - Main configuration entry point
- [**PRINCIPLES.md**](PRINCIPLES.md) - Foundation for all decision-making
- [**RULES.md**](RULES.md) - Actionable operational rules that enforce framework compliance
- [**MODES.md**](MODES.md) - Operational modes reference (Task Management, Introspection, Token Efficiency)

### Behavioral Modes

Different operational modes that adapt behavior based on task type:

- **MODE_DeepResearch** - Systematic investigation with evidence-based reasoning
- **MODE_Introspection** - Meta-cognitive analysis for self-reflection and reasoning optimization
- **MODE_Orchestration** - Intelligent tool selection for optimal task routing
- **MODE_Task_Management** - Hierarchical task organization with persistent memory
- **MODE_Token_Efficiency** - Symbol-enhanced communication for compressed clarity
- **MODE_Brainstorming** - Creative exploration and requirement discovery
- **MODE_Business_Panel** - Multi-expert analysis using established business frameworks

### Sub-Agents

Specialized agents for different domains (e.g., `@agent-leader`, `@agent-senior-engineer`, `@agent-junior-engineer`)

### Custom Commands

Workflow automation through slash commands:

| Command | Description |
|---------|-------------|
| `/fix-and-push` | Execute tasks with testing and automatic commits |
| `/pr-manager` | Pull request monitoring and management |
| `/nightly-tasks` | Automated nightly bug fixing and PR management |
| `/ultrathink` | Deep analysis with sequential reasoning |

#### SuperClaude Commands (`/sc:*`)

| Command | Description |
|---------|-------------|
| `/sc:brainstorm` | Interactive requirements discovery |
| `/sc:task` | Complex task execution with delegation |
| `/sc:implement` | Feature implementation |
| `/sc:improve` | Code quality improvements |
| `/sc:research` | Deep web research |
| `/sc:analyze` | Code quality analysis |
| `/sc:design` | Architecture and API design |
| `/sc:test` | Test execution and coverage |
| `/sc:cleanup` | Code cleanup and optimization |
| `/sc:git` | Git operations with intelligent commits |
| `/sc:build` | Build and compilation |

### Global Skills via npx

Install useful skills globally for use across any project:

```bash
# Documentation lookup
npx -y @modelcontextprotocol/create-server context7

# Code review tools
npx -y @coderabbit/ai-code-review

# Hugging Face integration
npx -y @huggingface/huggingface-mcp
```

These skills are available globally once installed via npx, providing:
- **Context7**: Official library documentation lookup
- **CodeRabbit**: AI-powered code review
- **HuggingFace MCP**: Model/dataset/search integration

## Usage Patterns

### Basic Workflow

The standard development workflow for most tasks:

1. **`/batch`** or enter plan mode — Break down task into parallel workstreams
2. **Review & Accept** — If plan is too complex or unclear, use `/interview:interview` to refine requirements
3. **`/simplify`** — Review changed code for reuse, quality, and efficiency; fix any issues
4. **`cm`** or **`/commit:commit`** — Create semantic commit with changes

### Starting a Development Task

1. **Understand Requirements** - Use `/sc:brainstorm` for discovery
2. **Design Solution** - Leverage architecture agents (`backend-architect`, `feature-architect`)
3. **Implement** - Assign to multiple `@agent-senior-engineer` to work in parallel
4. **Test & Review** - Activate `code-quality-enforcer` and `code-reviewer`
5. **Optimize** - Use `/sc:improve`

### Quick Fix

1. **Fix and commit** - Use `/fix-and-push` for implementation and commit

### Research Tasks

1. Use `/sc:research` to activate
2. Native Claude Code: `Research about ...`

## Git Workflow

- Semantic commit format with consistent scope
- Use simple English—avoid words like "comprehensive", "elaborate", "extensive"

### Shortcuts

- `cm` → commit changes (`/commit:commit`)
- `cp` → commit and push (`/commit:and-push`)
- `ok`, `c`, `continue` → acknowledge and continue
- `p`, `parallel` → assign tasks to multiple agents in parallel

## Directory Structure

```
.claude/
├── agents/                  # Specialized agents
├── commands/               # Custom slash commands
│   └── sc/                 # SuperClaude sub-commands
├── skills/                 # Symlinked global skills
├── CLAUDE.md              # Entry point
├── PRINCIPLES.md          # Core principles
├── RULES.md               # Operational rules
├── MODES.md               # Behavioral modes reference
└── README.md              # This file
```

## License & Attribution

MIT.
