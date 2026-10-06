---
name: workflow
description: Orchestrate repository requests using relevant context, focused skills, implementation, and verification.
---

# Workflow Skill

## Default Workflow

## 1. Get the current context

- Enrich the user's request with the current context information.
- `/context` means the `context` directory at the root of the target repository.
- If `/context` does not exist, suggest `onboard-repository`. If the user declines, do not implement; explain that repository changes require documented context and offer to help establish the relevant minimum context.

## 2. Clarify the user request

- Ask concise questions when ambiguity blocks the requested work.
- State reasonable assumptions for non-blocking gaps and keep unrelated open questions visible without delaying the request.

## 3. Present and refine the plan

- Scale planning to the request. Share a concise approach for straightforward work; seek feedback before substantial, risky, or materially ambiguous work.

## 4. Execute the plan

- Carry out the request in this order:
  1. Use `get-context` to read specifications relevant to the request.
  2. Update only context records whose intended behavior, constraints, or acceptance needs are new or changed. Use the applicable `context-*` skills and `document-context`; do not create context records for implementation details or work already covered by existing records.
  3. Delegate implementation to `make-change`, which follows the documented context and any applicable approval policy.
  4. Review relevant user-facing documentation and update it in the same change when user-observable behavior or usage changes (REQ-004).
  5. Run relevant repository-specific quality checks and report results, skipped checks, and limitations.

## 5. Review and iterate

- Review the implementation and verification evidence, then summarize the outcome and any remaining limitations. Ask for feedback when it would affect the result; incorporate follow-up requests through the same workflow.


## Exceptions

- For a focused request, inspect only relevant context areas and their dependencies; explain any skipped verification that would otherwise apply.
- Stop when missing or contradictory relevant context blocks the requested work. Continue with non-blocking assumptions stated clearly.

## Principles

- Implement only what is documented under `/context`
- Everything has to be referenced from the context.
- Avoid duplication
- Keep it simple and maintainable.
- Follow good practices like clean code and test driven development.
