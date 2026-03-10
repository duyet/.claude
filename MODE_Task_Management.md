# Task Management Mode

**Purpose**: Structured task tracking and execution for complex multi-step operations.

## Activation Triggers
- Operations with 3+ steps requiring coordination
- Multiple file/directory scope (>2 directories OR >3 files)
- Complex dependencies requiring phases
- Quality improvement requests: polish, refine, enhance

## Task Tracking Layers

### Layer 1: TodoWrite (Session Tasks)
- **Scope**: Current Claude Code session
- **States**: pending, in_progress, completed, blocked
- **Capacity**: 3-20 tasks per session
- **Usage**: `TodoWrite` to create/update tasks within a session

### Layer 2: TaskCreate/TaskUpdate (Persistent Tasks)
- **Scope**: Multi-session features (days to weeks)
- **Persistence**: Survives session restarts
- **Usage**: `TaskCreate` for new tasks, `TaskGet`/`TaskList` to check status, `TaskUpdate` to mark progress

### Layer 3: Agent Tool (Parallel Delegation)
- **Scope**: Complex multi-domain operations
- **Subagent types**: team-agents:leader, team-agents:senior-engineer, team-agents:junior-engineer
- **Features**: Parallel execution, isolated worktrees, background processing

### Layer 4: Skills (Iterative Workflows)
- **Scope**: Recurring or structured workflows
- **Usage**: `/loop` for periodic tasks, `/sc:task` for structured execution

## Memory Persistence

### Auto Memory Directory
Store persistent context in `~/.claude/projects/*/memory/`:
```
# Save progress
Write to memory/task-progress.md with current state

# Resume next session
Read memory/task-progress.md to restore context
```

### What to Persist
- Current plan and phase
- Completed vs remaining tasks
- Key decisions made
- Blockers encountered

### What NOT to Persist
- Temporary debugging state
- Session-specific file paths
- Duplicate info already in CLAUDE.md

## Execution Pattern

1. **Assess**: Read existing memory files for prior context
2. **Plan**: Break work into phases with TodoWrite
3. **Execute**: Work through tasks, update status
4. **Delegate**: Use Agent tool for parallelizable subtasks
5. **Checkpoint**: Write progress to memory directory periodically
6. **Complete**: Update memory with outcomes, clean temp state

## Tool Selection by Task Type

| Task Type | Primary Tool | Tracking |
|-----------|-------------|----------|
| Analysis/research | Agent (Explore) | TodoWrite |
| Multi-file implementation | Agent (team-agents:senior-engineer) | TaskCreate |
| Code review | Agent (feature-dev:code-reviewer) | TodoWrite |
| Architecture design | Agent (Plan) | Memory file |
| Documentation lookup | Context7 MCP / WebSearch | N/A |
| Testing | Bash (test runner) | TaskUpdate |

## Task State Management
- **pending**: Ready for execution
- **in_progress**: Currently active (one at a time for focus)
- **blocked**: Waiting on dependency or user input
- **completed**: Finished and verified
