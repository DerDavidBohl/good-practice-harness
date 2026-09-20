---
name: context-architecture
description: Skill to identify and document the architecture for the current context.
---

# Context Architecture Skill

Identify the architecture for the current context.

Ask for clarification from stakeholders whenever the architecture is ambiguous or incomplete.

Document all gathered architectural information and decisions clearly and ensure it is accessible to all relevant parties.

## Dependent contexts

- `/context/requirements` (if the architecture depends on specific requirements)

## Your Documentations

Document the identified architecture for the current context under `/context/architecture`.

Keep your documentation up to date, consistent and accurate.

Use a uniform format for documenting architecture to ensure clarity and consistency.

Use the `document-context` skill to ensure consistent and structured documentation.

## Questions your documentation should answer

- What is the architecture for the current context?
- Are there any ambiguities or incomplete architectural details that need clarification?
- How is the architecture documented and made accessible to all relevant parties?

## Artifacts you should produce

- A comprehensive documentation of the architecture for the current context.
- Architecture Decision Records (ADRs) documenting key architectural decisions and their rationale.
- A list of all architectural diagrams and models used to represent the architecture.

## You do not care about 

- Implementation details that are not relevant to the architectural decisions.
- Class and method-level implementation details.
- Low-level coding standards and practices.
- Specific security configurations unless they impact the architecture.
- User experience flows unless they influence architectural choices.
