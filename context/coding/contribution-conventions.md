# Contribution and Documentation Conventions

### Skill metadata stays aligned with its purpose

**ID: COD-001**

Skill names should be lowercase and hyphenated, and each skill's declared name and description should remain aligned with the capability it provides.

**Verification:** Review skill metadata when a capability is added, renamed, or changed.

### Context records use stable identities and readable prose

**ID: COD-002**

Context contributions must follow the repository-local context template, assign each atomic record a stable type-prefixed ID, and group related records in topic documents. Record content must specify intended behavior or decisions rather than describe current implementation observations.

**Verification:** Validate the context structure and review record IDs, references, and scope as described in [QUA-001](../quality/context-readiness.md#context-structure-and-record-identity-are-valid).

### Plugin metadata and documentation remain consistent

**ID: COD-003**

Changes to plugin capabilities or metadata must keep the plugin manifest and user-facing documentation consistent with the capabilities actually intended to be provided.

**Verification:** Validate manifest syntax and review documented capability names against the maintained skill set. The `make-change` capability owns implementation; the resolved decision is recorded under [CLR-002](../architecture/workflow-and-boundaries.md#make-change-is-the-implementation-capability).

### Python is not used for repository work

**ID: COD-004**

Do not introduce Python for repository source code, scripts, tests, builds, or validation. Use the existing shell or PowerShell tooling, or tooling native to the project, where applicable.

**Verification:** Review added or changed automation and project files to ensure Python is not required.