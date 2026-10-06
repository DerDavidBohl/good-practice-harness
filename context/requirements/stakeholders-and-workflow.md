# Stakeholders and Workflow Goals

### The harness serves plugin maintainers and AI coding tool users

**ID: REQ-001**

The primary stakeholders are plugin maintainers, who define and maintain the workflow, and AI coding tool users, who apply it to repositories. The harness helps them establish a clear, shared specification before repository changes are made.

### Repository context is the decision basis for changes

**ID: REQ-002**

Repository work governed by the harness must be based on documented context specifications. Implementation observations must not be substituted for stakeholder intent or treated as requirements.

**Rationale:** This keeps intended behavior distinct from what an existing implementation happens to do.

### Implementation follows complete, validated context

**ID: REQ-003**

Before implementation begins, context relevant to the requested change must be sufficiently complete, internally consistent, and validated. If an ambiguity blocks the work, the context must be clarified first; non-blocking gaps must remain visible as assumptions or open clarifications.

**Verification:** The agent reviews relevant context for coverage, consistency, and unresolved blockers before implementation proceeds. Any repository-specific verification checks established during onboarding are run when relevant. A context structure validator may support this review but does not replace it.

### User-facing documentation stays current with changes

**ID: REQ-004**

Every change must include a review of the relevant user-facing documentation. When a change affects user-observable behavior, setup, configuration, interfaces, workflows, or troubleshooting, update the applicable user documentation in the same change. If no user-facing documentation update applies, state the reason in the change summary.

**Rationale:** Users should be able to rely on the documentation to understand and use the current behavior of the repository.

### Open distribution terms require maintainer clarification

**ID: CLR-001**

The repository does not specify licensing or distribution expectations. This remains open for maintainers and does not block context documentation, but changes that establish or communicate distribution terms require clarification first.