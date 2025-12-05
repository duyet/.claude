---
allowed-tools: [Read, Bash, Glob, TodoWrite, Edit, Write]
description: "Do the task or fixing tests, commit and push"
---

# /fix-and-push - Fix tests, commit changes, and run git push

## Purpose

Execute tests, fix the failed tests, run all tests to make sure the fixes are successful, commit the changes, and run git push to update the current branch with remote.

## Usage

```
/fix-and-push
```

```
/fix-and-push

<error message or test names>
<user note or todo list>
```

## Execution

1. Discover and categorize available tests or giving the specific test names or failed tests and error messages
2. Try to fix the failed tests, use think or asking sub-agents if the issue is complex
3. Execute tests with appropriate configuration
4. Monitor test results and collect metrics
5. Think about the reason for test failures and apply to fix it for another related tests as well as needed.
6. Commit the changes if tests pass or back to step 2 if tests fail
7. Run git push to update current branch with remote.

Note:
- If there are repeated failures and you found the root cause, you can consider to taking notes to CLAUDE.md into that folder (e.g. main frontend/CLAUDE.md or backend/CLAUDE.md if that file available) for future reference.
- Make sure you plan create todo list to keep track. todo list can be change during the process, like if you found new issues or tasks that need to be addressed.
- You can spawn to parallel agents to help you with the tasks, like fixing tests, writing commit messages, etc.
- If not mentioned, use mock for external dependencies like databases, external apis, etc.
- Think about the logic of the tested functions and whether they make sense, instead of just making the tests work.

