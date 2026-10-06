# Workflow and Boundaries

### Capabilities are organized as focused skills in a repository workflow

**ID: ADR-001**

The harness presents repository-context work as focused capabilities for onboarding, requirements, architecture, security, user experience, quality, coding, and context documentation. The workflow coordinates these capabilities in dependency order so later context can rely on earlier decisions.

**Rationale:** Focused responsibilities make the workflow easier to apply and maintain while retaining a coherent decision process.

### Normative context is separate from implementation material

**ID: ADR-002**

Context specifications describe intended outcomes and constraints. Repository implementation, configuration, and conformance evidence remain separate and may be used for implementation or verification only after the relevant context is established. This supports [REQ-002](../requirements/stakeholders-and-workflow.md#repository-context-is-the-decision-basis-for-changes).

### An implementation capability remains unspecified

**ID: CLR-002**

This checkout does not provide an `implement-context` skill definition. Its intended availability, scope, and relationship to the make-change workflow remain unresolved. Do not infer missing implementation behavior from the name alone.

### Supported Copilot CLI and plugin versions need definition

**ID: CLR-004**

The repository does not define supported Copilot CLI or plugin versions, nor a compatibility policy. Maintainers should clarify the supported environment when making compatibility guarantees or changes that depend on version-specific behavior.