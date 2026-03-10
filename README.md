# duyet's `.claude` setup

My `.claude` configuration for Claude Code.

## Core Components

- [**CLAUDE.md**](CLAUDE.md) - Main configuration entry point
- [**PRINCIPLES.md**](PRINCIPLES.md) - Foundation for all decision-making
- [**RULES.md**](RULES.md) - Actionable operational rules
- [**MODES.md**](MODES.md) - Behavioral modes reference

### Custom Commands

| Command | Description |
|---------|-------------|
| `/fix-and-push` | Execute tasks with testing and automatic commits |
| `/pr-manager` | Pull request monitoring and management |
| `/ultrathink` | Deep analysis with sequential reasoning |

### Suggested Skills

```bash
# Documentation lookup
npx skills add https://github.com/upstash/context7 --skill documentation-lookup

# Code review
npx skills add https://github.com/coderabbitai/skills --skill code-review

# Frontend design
npx skills add https://github.com/anthropics/skills --skill frontend-design

# Skill creation
npx skills add https://github.com/anthropics/skills --skill skill-creator

# PDF tools
npx skills add https://github.com/anthropics/skills --skill pdf

# Team coordination
npx skills add https://github.com/duyet/claude-plugins --skill team-coordination

# shadcn/ui
npx skills add https://github.com/shadcn/ui --skill shadcn
```

## Basic Workflow

1. **`/batch`** or plan mode — Break down task into parallel workstreams
2. **Review & Accept** — Use `/interview:interview` if plan needs refinement
3. **`/simplify`** — Review code for quality and efficiency
4. **`cm`** or **`/commit:commit`** — Create semantic commit

## Shortcuts

- `cm` → commit changes
- `cp` → commit and push
- `p`, `parallel` → assign tasks to multiple agents

## License

MIT
