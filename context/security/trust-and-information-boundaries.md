# Trust and Information Boundaries

### Repository material uses the normal local developer trust boundary

**ID: SEC-001**

For this harness, repository content and files are treated with the same trust assumptions as the user's local developer workspace. This onboarding does not establish a separate sandboxing or hostile-input policy.

**Rationale:** This is the stakeholder-provided baseline for the current repository context, not a claim that arbitrary repository content is intrinsically safe.

### Handling of secrets and untrusted repositories is unspecified

**ID: CLR-003**

No repository-specific policy defines whether or how secrets are detected, redacted, or retained in generated context, or what additional safeguards apply to repositories from untrusted sources. Maintainers must clarify these expectations before work whose security depends on them.