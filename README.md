# duyet's `.claude` setup

My `.claude` configuration for Claude Code.

## Core Components

- [**CLAUDE.md**](CLAUDE.md) - Main configuration entry point.
- [**PRINCIPLES.md**](PRINCIPLES.md) - Foundation for all decision-making including:
- [**RULES.md**](RULES.md) - Actionable operational rules that enforce framework compliance

**Behavioral Modes:** Different operational modes that adapt behavior based on task type:

- **MODE_DeepResearch.md** - Systematic investigation with evidence-based reasoning
- **MODE_Introspection.md** - Meta-cognitive analysis for self-reflection and reasoning optimization
- **MODE_Orchestration.md** - Intelligent tool selection for optimal task routing
- **MODE_Task_Management.md** - Hierarchical task organization with persistent memory
- **MODE_Token_Efficiency.md** - Symbol-enhanced communication for compressed clarity
- **MODE_Brainstorming.md** - Creative exploration and requirement discovery
- **MODE_Business_Panel.md** - Multi-expert analysis using established business frameworks

### Sub-Agents

Specialized agents for different domains (e.g. [`@agent-leader`](agents/leader.md), [`@agent-backend-architect`](agents/backend-architect.md))

### Custom Commands

Workflow automation through slash commands:

- `/fix-and-push` - Execute tasks with testing and automatic commits
- `/pr-manager` - Pull request monitoring and management
- `/nightly-tasks` - Automated nightly bug fixing and PR management
- `/ultrathink` - Deep analysis with sequential reasoning
- `/sc:brainstorm` - Interactive requirements discovery
- `/sc:test` - Test execution and coverage
- `/sc:cleanup` - Code cleanup and optimization
- `/sc:design` - Architecture and API design
- `/sc:task` - Complex task execution
- `/sc:git` - Git operations with intelligent commits
- `/sc:build` - Build and compilation
- `/sc:research` - Deep web research
- `/sc:analyze` - Code quality analysis
- `/sc:implement` - Feature implementation
- `/sc:improve` - Code quality improvements

### MCP Integrations

Model Context Protocol servers for extended capabilities:

- **MCP_Context7.md** - Official library documentation lookup
- **MCP_Sequential.md** - Multi-step reasoning and analysis engine

## Usage Patterns

### Starting a Development Task

1. **Understand Requirements** - Use `/sc:brainstorm` for discovery
2. **Design Solution** - Leverage architecture agents (`backend-architect`, `feature-architect`)
3. **Implement** - `Asign to multiple @agent-senior-engineer to working in parallel`
4. **Test & Review** - Activate `code-quality-enforcer` and `code-reviewer`
5. **Optimize** - Use `/sc:improve`

### Quick fix

1. **Fix and commit** - Use `/fix-and-push` for implementation and commit

### Research Tasks

1. Use `/sc:research` to activate
2. Native Claude Code: `Research about ...`


## Git Workflow

Semantic commit rules.

## Directory Structure

```
.claude/
├── agents/                  # 30+ specialized agents
├── commands/               # Custom slash commands
│   └── sc/                 # Sub-commands namespace
├── CLAUDE.md              # Entry point
├── PRINCIPLES.md          # Core principles
├── RULES.md               # Operational rules
├── MODE_*.md              # Behavioral modes
├── MCP_*.md               # MCP integrations
└── README.md              # This file
```

## License & Attribution

MIT.

