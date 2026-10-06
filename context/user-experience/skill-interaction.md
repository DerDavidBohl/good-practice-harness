# Skill Interaction

### Users can request a focused repository-context capability

**ID: UX-001**

Users should be able to invoke a named capability in their AI coding tool and receive work scoped to the current repository. The capability should make clear which context area or workflow step it addresses.

### Clarifications and blockers are visible before dependent work

**ID: UX-002**

When stakeholder intent is ambiguous, users should be asked concise, relevant questions. A blocking clarification must be stated before dependent work proceeds; non-blocking assumptions and open questions must remain discoverable in the context index.

**Acceptance:** Users can identify the unresolved decision, its impact, and whether it blocks the requested work.

### Context is navigable and readable by repository participants

**ID: UX-003**

Context documentation should provide an overview, scope, and direct navigation to related specifications. Records should explain intent in readable prose and identify related decisions without requiring readers to reconstruct a workflow from implementation details.

### Onboarding selects context areas with a consistent relevance test

**ID: UX-004**

During onboarding, an area is applicable when it contains requirements, decisions, risks, quality expectations, or user flows relevant to the repository. Every area marked `N/A` includes a concise reason so users can understand the scope decision.

**Acceptance:** The onboarding summary identifies applicable areas and gives a reason for each area marked `N/A`.