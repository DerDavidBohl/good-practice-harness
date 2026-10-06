---
name: make-change
description: Skill to make changes in the current project context. Use it whenever the functionality or behavior of the project needs to be modified.
---

# Make Change Skill

Implement the requested change using the current repository context. This may include code, configuration, infrastructure, tests, or documentation; it does not mean implementing documentation context itself.

Do not begin implementation until the relevant context specification has been updated for this requested change. This is required even when existing context covers the general behavior. Use the applicable `context-*` and `document-context` skills to establish the requested intent and acceptance needs first; do not document implementation details. Resolve blocking gaps or contradictions before implementation. Non-blocking assumptions may proceed when stated clearly and recorded where relevant.

Keep the implementation traceable to the documented context. The normative context remains focused on specifications while implementation behavior and configuration remain in the implementation.

Use `get-context` to retrieve relevant context when this skill is invoked directly. When coordinated by `workflow`, use the context it has already established instead of repeating the same read.

The required context update must precede every implementation change. Update or add the relevant specification to capture the requested change's intent and acceptance needs, maintaining the existing record where appropriate rather than duplicating it. Do not document implementation details.

Implement changes only when they are defined by existing context specifications. Stakeholder approval is informal by default; when `context/README.md` defines a stronger approval policy, verify that policy before implementation.

For every change, review the relevant user-facing documentation. Update it in the same change whenever user-observable behavior, setup, configuration, interfaces, workflows, or troubleshooting changes. Do not wait for the user to explicitly request documentation. If no user-facing documentation update applies, state why in the change summary.

Run the relevant checks established by the repository's quality context and conventions. Report the checks run and their results, plus any skipped checks or limitations. Do not treat a context structure validator as evidence of implementation behavior.
