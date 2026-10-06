---
name: onboard-repository
description: Skill to onboard a repository to this harness
---

# Onboard Repository Skill

Use all applicable `context-*` skills to gather and document the repository in this order: `get-context`, `context-requirements`, `context-architecture`, `context-security`, `context-user-experience`, `context-quality`, `context-coding`, `document-context`.

Treat a context area as applicable when it contains requirements, decisions, risks, quality expectations, or user flows relevant to the repository. Create the `context` directory and a `README.md` for each applicable area. Mark every non-applicable area `N/A` with a concise reason in the root context README. During onboarding, create repository-local templates inside `context` for applicable areas. These templates are starting points for future records, not harness-wide templates.

Use each README as an index and overview containing links, scope, and navigation. Group related requirements, decisions, standards, quality attributes, security records, UX records, and clarifications into a small number of descriptive Markdown files by coherent topic under the applicable context directory. Use a separate file for a record when it is unusually large or independently maintained. Keep context records and record IDs in the topic files.

Format records for reading, not database-style scanning: give each record a descriptive heading and ID, then explain its intent in prose. Add short labeled sections for rationale, constraints, dependencies, and verification expectations only when they add useful information. Avoid turning every record into a long list of fields.

Be accurate and ensure all relevant intended context is captured and documented comprehensively.

The purpose of onboarding is to establish the normative specification for a spec-driven repository. Existing context specifications are the sole decision basis for repository work. Define new or revised records through the context workflow and keep implementation material outside the normative context.

Represent decisions and requirements defined by the context specifications. When the context is incomplete or ambiguous, request clarification and update the specifications before relying on the result. Leave the context incomplete when clarification is unavailable, and keep implementation behavior separate from requirements.

All records created by onboarding express intended behavior, requirements, decisions, constraints, quality goals, security expectations, or user experience expectations. They focus on the specification rather than implementation observations, conformance assessments, source-code references, file paths, class names, command names, or configuration values.

When creating repository-local templates, structure records around their relationship to existing context specifications. Keep implementation-derived fields outside the normative template.

## Repository verification

Use the documented quality context to understand how the repository should be verified. Inspect its existing tests, checks, scripts, and conventions, then identify useful repeatable checks with the agent. Create or adapt repository-local verification scripts only when they provide value for that repository; do not impose a universal toolchain or test suite. Keep scripts and tool-specific instructions outside `/context`, and keep the quality expectations they verify in context records. The agent reviews the results and reports uncovered expectations, failures, and limitations.

Onboarding is complete only when:

- `context/README.md` exists and links to each applicable context area.
- Each applicable context directory has a `README.md` and a repository-local template.
- Each README contains only an overview, scope, links, and navigation; it contains no atomic records or record IDs.
- Related records are grouped into readable topic files rather than one file per record.
- Each atomic record has a unique, stable ID using the documented prefix format.
- Every context reference resolves to an existing record or file.
- Each non-applicable context area is explicitly marked `N/A` with a reason.
- Open assumptions, conflicts, and blocking clarifications are listed.
- The agent reviews context structure, references, completeness, and consistency; the bundled context validator may be used as a supporting structural check.
- Repository-specific verification needs are identified, and any useful scripts are created or adapted outside `/context`.
- Verification results and remaining limitations are reported to the user.

If a clarification blocks onboarding, stop at that context and report what is blocked. Continue with independent, non-blocked contexts when possible.
