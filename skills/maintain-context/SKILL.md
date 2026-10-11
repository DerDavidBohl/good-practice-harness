---
name: maintain-context
description: Review and update repository context specifications for completeness, consistency, and traceability. Use when auditing, clarifying, or maintaining the context that guides repository work.
---

# Maintain Context

Review and, when requested, update the repository's normative context while preserving confirmed intent and established workflows.

## Procedure

1. Determine the requested scope. Treat the repository-root `context/` directory as the specification source and use `get-context` plus the relevant `context-*` skills and `document-context` conventions. If context is absent, recommend `onboard-repository`; do not invent a replacement specification.
2. Review the relevant context indexes and records for missing intent or acceptance needs, contradictions, stale references, unclear scope, record identity problems, and broken navigation. Read adjacent context only as needed to check dependencies and consistency.
3. Keep stakeholder intent distinct from implementation observations. Code, tests, configuration, and existing documentation may reveal possible drift or a question to resolve, but do not treat them as authority to change normative context without confirmation.
4. Resolve blocking ambiguities with concise questions before changing affected specifications. For non-blocking assumptions, state them and document them where relevant.
5. When asked to update context, revise the narrowest applicable specification. Preserve stable record IDs, add an ID for each new atomic record, update indexes and cross-references, and avoid documenting implementation details or duplicating existing records.
6. Validate the result using applicable repository checks and a manual review. Check record IDs, references, index navigation, readability, and that the change expresses confirmed intent. Structural validators support but do not replace this review.
7. Report the areas reviewed, findings, records changed, assumptions or blockers, and validation results or limitations. Identify any suggested updates not made.

## Boundaries

- This capability maintains repository context; it does not audit or update agent skills for format or host-platform conformance.
- Do not make implementation changes as part of context maintenance. Use `workflow` and `make-change` for implementation requests after the relevant context has been established.
- Keep context focused on requirements, decisions, constraints, quality goals, security expectations, and user experience expectations. Implementation and verification details remain outside normative context.
- Use applicable context-area skills to establish the intent and acceptance needs for requested changes, even when existing context covers the general topic.