---
name: make-change
description: Skill to make changes in the current project context. Use it whenever the functionality or behavior of the project needs to be modified.
---

# Make Change Skill

Implement the requested change using the current repository context. This may include code, configuration, infrastructure, tests, or documentation; it does not mean implementing documentation context itself.

Pause for a context update only when relevant specifications are missing, contradictory, or do not define the requested outcome well enough to implement it. Non-blocking assumptions may proceed when stated clearly.

Keep the implementation traceable to the documented context. The normative context remains focused on specifications while implementation behavior and configuration remain in the implementation.

Use `get-context` to retrieve relevant context when this skill is invoked directly. When coordinated by `workflow`, use the context it has already established instead of repeating the same read.

Update context before implementation only when the requested behavior, constraints, or acceptance needs are new or changed. Use the applicable `context-*` and `document-context` skills; do not document implementation details or duplicate existing specifications.

Implement changes only when they are defined by existing context specifications. Stakeholder approval is informal by default; when `context/README.md` defines a stronger approval policy, verify that policy before implementation.

For every change, review the relevant user-facing documentation. Update it in the same change whenever user-observable behavior, setup, configuration, interfaces, workflows, or troubleshooting changes. Do not wait for the user to explicitly request documentation. If no user-facing documentation update applies, state why in the change summary. Follow requirement REQ-004.

Run the relevant checks established by the repository's quality context and conventions. Report the checks run and their results, plus any skipped checks or limitations. Do not treat a context structure validator as evidence of implementation behavior.
