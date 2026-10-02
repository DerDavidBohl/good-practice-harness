---
name: make-change
description: Skill to make changes in the current project context. Use it every time you need to implement modifications.
---

# Make Change Skill

Implement the requested change using the current repository context. This may include code, configuration, infrastructure, tests, or documentation when those are part of the approved request; it does not mean implementing documentation context itself.

Pause for a context update whenever the context specifications are ambiguous or incomplete.

Keep the implementation traceable to the documented context. The normative context remains focused on specifications while implementation behavior and configuration remain in the implementation.

Use the `get-context` skill to retrieve and utilize existing context information for the current project.

Make sure to document all changes in the context before implementing them.

Implement changes only when they are defined by existing context specifications. Stakeholder approval is informal by default; when `context/README.md` defines a stronger approval policy, verify that policy before implementation.

Follow the boy scout rule: always leave the context in a better state than you found it. This ensures that the context remains accurate and up-to-date for future work.
