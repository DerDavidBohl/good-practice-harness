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

**Verification:** The relevant context is reviewed for coverage and unresolved blockers, and the repository context validator passes before implementation proceeds.

### Open distribution terms require maintainer clarification

**ID: CLR-001**

The repository does not specify licensing or distribution expectations. This remains open for maintainers and does not block context documentation, but changes that establish or communicate distribution terms require clarification first.