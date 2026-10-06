# Workflow and Boundaries

### Capabilities are organized as focused skills in a repository workflow

**ID: ADR-001**

The `workflow` capability coordinates the default repository-request path. It reads relevant context, resolves blocking questions, and delegates implementation to `make-change`; focused context skills own their named documentation areas, and `make-change` owns implementation and verification. Users may invoke a focused capability directly for scoped work, which follows the same applicable context and verification rules without repeating unrelated steps.

**Rationale:** Focused responsibilities make the workflow easier to apply and maintain while retaining a coherent decision process.

### Verification guidance stays generic while onboarding tailors checks

**ID: ADR-003**

Harness skills guide agent-led verification without assuming a repository's languages, frameworks, or tooling. Onboarding may create or adapt repository-local verification scripts from that repository's documented quality needs and existing conventions. Such scripts are implementation material, not normative context.

**Rationale:** This keeps the harness reusable across repositories while making repeatable verification practical for each onboarded project. This supports [QUA-004](../quality/context-readiness.md#verification-is-agent-led-and-repository-specific).

### Normative context is separate from implementation material

**ID: ADR-002**

Context specifications describe intended outcomes and constraints. Repository implementation, configuration, and conformance evidence remain separate and may be used for implementation or verification only after the relevant context is established. This supports [REQ-002](../requirements/stakeholders-and-workflow.md#repository-context-is-the-decision-basis-for-changes).

### `make-change` is the implementation capability

**ID: CLR-002**

**Status:** Resolved.

There is no separate `implement-context` capability in this harness. `make-change` is the implementation capability and follows any repository-specific approval policy documented in `context/README.md`.

### Supported Copilot CLI and plugin versions need definition

**ID: CLR-004**

The repository does not define supported Copilot CLI or plugin versions, nor a compatibility policy. Maintainers should clarify the supported environment when making compatibility guarantees or changes that depend on version-specific behavior.