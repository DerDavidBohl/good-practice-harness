# Context Readiness and Verification

### Context structure and record identity are valid

**ID: QUA-001**

Before implementation, the context tree must have a root index, an index and repository-local template for every applicable area, and uniquely identified records in grouped topic documents. Context references must resolve to existing records or files.

**Verification:** The agent reviews the context tree, record identity, links, and cross-references. A context structure validator may be used as a supporting check; passing it alone does not establish that references resolve or that context is complete.

### Context is complete enough to guide the requested change

**ID: QUA-002**

The context relevant to a requested change must express its intended behavior, constraints, and acceptance needs clearly enough to serve as the decision basis. Blocking gaps or conflicts must be resolved before implementation; unrelated or non-blocking gaps remain explicit.

**Verification:** Review the relevant records for coverage and consistency, and confirm no unresolved clarification blocks the requested work, as required by [REQ-003](../requirements/stakeholders-and-workflow.md#implementation-follows-complete-validated-context).

### Verification is agent-led and repository-specific

**ID: QUA-004**

The agent determines how to verify a repository from its documented quality needs and existing project conventions. Onboarding may create or adapt repository-local verification scripts when repeatable checks are useful; the harness skills remain generic and do not prescribe a universal toolchain or test suite.

**Verification:** The agent checks that verification guidance and any generated scripts match the repository's documented quality needs, use its established tools, and remain outside normative context records.

### Context records remain readable and maintainable

**ID: QUA-003**

Related records should be grouped by coherent topic and written for readers rather than optimized as database fields. Each record must remain independently understandable and traceable by a stable ID.