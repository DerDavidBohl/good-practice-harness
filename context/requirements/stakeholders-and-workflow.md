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

Before implementation begins, the context relevant to the requested change must be sufficiently complete, internally consistent, and validated. Update context records when the requested behavior, constraints, or acceptance needs change; do not add records for implementation details or work already covered by existing context. If relevant context is missing or a blocking ambiguity remains, clarify and document it before implementation. If no repository context exists and the user declines onboarding, stop before implementation and explain what context is needed. Non-blocking gaps may remain open when their assumptions are stated.

**Verification:** The agent reviews relevant context for coverage, consistency, and unresolved blockers before implementation proceeds. Relevant repository-specific checks are run after implementation, and their results and limitations are reported. A context structure validator may support context review but does not replace it.

### User-facing documentation stays current with changes

**ID: REQ-004**

Every change must include a review of the relevant user-facing documentation. When a change affects user-observable behavior, setup, configuration, interfaces, workflows, or troubleshooting, update the applicable user documentation in the same change. If no user-facing documentation update applies, state the reason in the change summary.

**Rationale:** Users should be able to rely on the documentation to understand and use the current behavior of the repository.

### Open distribution terms require maintainer clarification

**ID: CLR-001**

The repository does not specify licensing or distribution expectations. This remains open for maintainers and does not block context documentation, but changes that establish or communicate distribution terms require clarification first.