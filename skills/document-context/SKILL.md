---
name: document-context
description: Skill to document context in a structured and consistent manner. Use it when you create or update context documentation. I. e. when adding new requirements, decisions, standards, or clarifications.
---

# Document Context Skill

This skill describes how to document specifications under the `/context` directory in a structured and consistent manner.

## Rules 

- Keep a single source of truth for context documentation.
- Ensure the source of truth is referenced if it is relevant for another context.
- Document context under the `context` directory at the root of the target repository.
- Create a `README.md` for each context directory to provide an overview and essential information about the context.
- When onboarding or when a context area is first created, create a repository-local `TEMPLATE.md` inside that context directory. The template must show the record fields and ID format needed for that context.
- Use each `README.md` as an index and overview containing links, scope, and navigation.
- Group related atomic context records into a small number of descriptive Markdown files under the applicable context directory. Choose files by coherent topic, such as `authentication.md`, `data-protection.md`, or `deployment.md`; use a separate file for a record when it is unusually large or independently maintained.
- Use `TEMPLATE.md` as a blank structure example for future records.
- Keep context documentation up to date and review it regularly to ensure accuracy and relevance.
- Use a consistent format and structure for documenting context to facilitate understanding and maintenance.
- Every atomic context record must have its own ID to uniquely identify it. A file-level ID does not satisfy this requirement.
- Ensure that context record IDs are consistent and follow the naming convention below.
- Ensure all documentation outside the `/context` directory is consistent with the context documentation.
- Ensure that all documented context always matches the current skills standards, rules and requirements.
- Always ensure that the context documentation is more accurate and more clear than before.
- Treat context records as the normative specifications for the repository.
- Keep context records focused on intended behavior, requirements, decisions, constraints, quality goals, security expectations, and user experience expectations.

## Record identity and traceability

For this skill, a **record** is one independently understandable item in a context document, such as a requirement, architecture decision, coding standard, quality attribute, security risk, user experience flow, or clarification. A file, section, table, or directory is not a substitute for the IDs of the records it contains.

When creating or updating context documentation:

- Assign an ID to every atomic record, including each item in a list and each row in a table.
- Use a type prefix and a zero-padded sequence number: `TYPE-NNN` (for example, `REQ-001`).
- Use these prefixes where applicable: `REQ` for requirements, `ADR` for architecture decisions, `COD` for coding standards, `QUA` for quality attributes, `SEC` for security records, `UX` for user experience records, and `CLR` for clarifications.
- Repositories may use additional uppercase alphanumeric prefixes by passing them to the validator: `scripts/validate_context.sh context PREFIX1 PREFIX2` on Bash or `scripts/Validate-Context.ps1 -ContextDir context -AdditionalIdPrefixes PREFIX1,PREFIX2` on PowerShell. Each prefix must start with a letter; the standard prefixes remain enabled.
- Keep IDs stable when editing a record. Do not reuse an ID for a different record.
- Assign the next available number within the relevant type when adding a new record.
- Put the ID directly on the record: use an `ID` column for tables, or a bold `ID: TYPE-NNN` label for prose records.
- Refer to related records by ID rather than repeating their full content. Check references after changes so they still resolve.
- If one statement contains multiple independently testable decisions or obligations, split it into separate records and assign each one an ID.
- An owner is optional. Add one only when ownership is useful for follow-up or accountability.
- Record status when useful to distinguish proposed, confirmed, deprecated, blocked, or superseded records.
- State the existing context specification that justifies each normative record.
- Keep implementation validation in the implementation and verification workflow; keep the specification focused on intended outcomes.
- Prefer readable prose over dense property lists. Each record should have a descriptive heading, its ID and a descriptive content
- Use bullet lists only for genuinely parallel items. Use tables only when readers need to compare the same fields across multiple records.

## Scope boundaries

- Requirements cover stakeholder goals, constraints, and acceptance needs.
- Architecture covers system structure, integrations, and technical decisions.
- Coding covers implementation conventions and practices.
- Quality covers measurable quality attributes, scenarios, and verification.
- Security covers assets, threats, controls, and residual risk.
- User experience covers user goals, flows, and interaction expectations.

Cross-cutting information belongs in the narrowest applicable context and is referenced from other contexts by ID.

## Completion and validation

Before declaring documentation complete, the agent reviews that the context README exists, applicable areas have README files and repository-local templates, IDs are unique and correctly formatted, and references resolve. The bundled `scripts/validate_context.sh` on Bash or `scripts/Validate-Context.ps1` on PowerShell may be used as a supporting structural check; passing either validator does not replace agent review. Pass the repository's additional prefix when using a validator and the repository uses one.

The validator must also confirm that README files contain no record IDs and that every non-template Markdown record file contains at least one record ID. A record file may contain multiple related records.

Temporary working questions may remain outside the normative records. When a clarification becomes part of the normative context, store it in a separate Markdown record file. A skill pauses when an unresolved clarification blocks its requested work and proceeds with an explicit assumption when it does not.

Approval is informal by default. Repositories that need stronger governance may define an approval policy in `context/README.md`; `implement-context` must follow that repository-specific policy.

## Normative record example

```md
### Container execution must be isolated

**ID: SEC-004*

**Status:** Proposed.

The system prevents untrusted repository content from obtaining host-level container control. Container operations are isolated behind an explicitly authorized boundary, and repository-derived paths and arguments are validated.
```

Implementation and verification work use normative records as their input.

Example table:

| ID | Requirement |
| --- | --- |
| `REQ-001` | Context documentation must be stored under `/context`. |
| `REQ-002` | Each atomic context record must have a stable ID. |

Example prose record:

### Architecture decision: context records are Markdown

**ID: ADR-001**

Context records use Markdown because they are readable in source control and by Copilot.
