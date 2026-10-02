# Context Readiness and Verification

### Context structure and record identity are valid

**ID: QUA-001**

Before implementation, the context tree must have a root index, an index and repository-local template for every applicable area, and uniquely identified records in grouped topic documents. Context references must resolve to existing records or files.

**Verification:** Run the bundled context validator and manually review links and cross-references, because structural validation alone does not establish that every reference resolves.

### Context is complete enough to guide the requested change

**ID: QUA-002**

The context relevant to a requested change must express its intended behavior, constraints, and acceptance needs clearly enough to serve as the decision basis. Blocking gaps or conflicts must be resolved before implementation; unrelated or non-blocking gaps remain explicit.

**Verification:** Review the relevant records for coverage and consistency, and confirm no unresolved clarification blocks the requested work, as required by [REQ-003](../requirements/stakeholders-and-workflow.md#implementation-follows-complete-validated-context).

### Context records remain readable and maintainable

**ID: QUA-003**

Related records should be grouped by coherent topic and written for readers rather than optimized as database fields. Each record must remain independently understandable and traceable by a stable ID.