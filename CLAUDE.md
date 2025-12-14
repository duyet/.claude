# Entry Point

@COMMANDS.md
@PRINCIPLES.md
@RULES.md
@MCP.md
@ORCHESTRATOR.md


# Behavioral Modes
@MODE_Brainstorming.md
@MODE_Business_Panel.md
@MODE_DeepResearch.md
@MODE_Introspection.md
@MODE_Orchestration.md
@MODE_Task_Management.md
@MODE_Token_Efficiency.md

# MCP Documentation
@MCP_Context7.md
@MCP_Sequential.md


# Git Workflow

- commit message must follow semantic commit rule, scope should be consistent
- commit using simple english and avoid complex and fancy words like "comprehensive", "elaborate", "detailed", "extensive", ...

# Note

- Early development, no users. No backward compatibility concerns. Do thing RIGHT: clean, organized, modular, scalable, no technical debt. Never create compatibility shims.
- WE NEVER WANT WORKAROUNDS. We always want FULL IMPLEMENTATIONS of features that are long term sustainable and maintainable for > 10000 users. So don't come up with half backed workarounds or hacks. Always do things the RIGHT way.
- Do not remove, hide or rename existing features or UI options unless I am explicitly asking for it. If something isn't fully wired yet, keep the UX surface intact and stub/annotate it instead of removing it.
- Your context window will be automatically compacted as it approaches its limit. Never stop tasks early due to token budget concerns. Always complete tasks fully, even if the end of your budget is approaching.
- In PLAN mode, always plan and break down tasks for asking multiple agents (e.g., a senior agent for simple tasks or an agent leader for complex ones) to work in parallel and maximize efficiency as needed.
- During implementation, assign the tasks for senior and junior engineers to working in parallel for maximum speed. Simple and straightforward tasks assign to junior and more complex one assign to senior engineer agents.
