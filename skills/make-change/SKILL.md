---
name: make-change
description: Skill to make changes in the current project context. Use it whenever the functionality or behavior of the project needs to be modified.
---

# Make Change Skill

Implement the requested change using the current repository context. This may include code, configuration, infrastructure, tests, or documentation; it does not mean implementing documentation context itself.

Pause for a context update whenever the context specifications are ambiguous or incomplete.

Keep the implementation traceable to the documented context. The normative context remains focused on specifications while implementation behavior and configuration remain in the implementation.

Use the `get-context` skill to retrieve and utilize existing context information for the current project.

Make sure to document all changes in the context before implementing them using the `context-*` and `document-context` skills.

Implement changes only when they are defined by existing context specifications. Stakeholder approval is informal by default; when `context/README.md` defines a stronger approval policy, verify that policy before implementation.

For every change, review the relevant user-facing documentation. Update it in the same change whenever user-observable behavior, setup, configuration, interfaces, workflows, or troubleshooting changes. Do not wait for the user to explicitly request documentation. If no user-facing documentation update applies, state why in the change summary. Follow requirement REQ-004.

Follow the boy scout rule: always leave the context in a better state than you found it. This ensures that the context remains accurate and up-to-date for future work.
