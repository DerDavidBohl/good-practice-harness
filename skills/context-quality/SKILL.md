---
name: context-quality
description: Skill to identify and document the quality for the current context.
---

# Quality Skill

Identify the quality for the current context.

Ask for clarification from stakeholders whenever the quality is ambiguous or incomplete.

Document all gathered quality information and decisions clearly and ensure it is accessible to all relevant parties.

## Dependent contexts

- `/context/requirements` (if the quality depends on specific requirements)
- `/context/architecture` (if the quality depends on the architecture i. e. the used technologies and design decisions)
- `/context/user-experience` (if the quality depends on the user experience)
- `/context/security` (if the quality depends on the security aspects)

Quality is evaluated after requirements, architecture, security, and user experience context is available. Coding standards are a downstream input, not a prerequisite.

## Your Documentations

Document the identified quality for the current context under `/context/quality`.

Keep your documentation up to date, consistent and accurate.

Use a uniform format for documenting quality to ensure clarity and consistency.

Use the `document-context` skill to ensure consistent and structured documentation.

## Questions your documentation should answer

- What is the quality for the current context?
- Are there any ambiguities or incomplete quality details that need clarification?
- How is the quality documented and made accessible to all relevant parties?

## Artifacts you should produce

- A comprehensive documentation of the quality for the current context.
- Test cases and scenarios documenting how quality is ensured and measured.
- A list of all quality-related diagrams and models used to represent the quality aspects.

## Scope

Document measurable quality attributes, quality scenarios, thresholds, and how they are verified. Do not use this context for general coding standards or implementation details that have no quality impact.

## You do not care about 

- Implementation details that do not impact quality.
- Low-level coding standards and practices unless they affect quality.
- Specific security configurations unless they influence quality.
- User experience flows unless they affect quality.
