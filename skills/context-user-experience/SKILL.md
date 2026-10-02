---
name: context-user-experience
description: Skill to identify and document the user experience for the current context.
---

# User Experience Skill

Identify the user experience for the current context.

Ask for clarification from stakeholders whenever the user experience is ambiguous or incomplete.

Document all gathered user experience information and decisions clearly and ensure it is accessible to all relevant parties.

## Dependent contexts

- `/context/requirements` (if the user experience depends on specific requirements)
- `/context/architecture` (if the user experience depends on the architecture i. e. the used technologies and design decisions)

## Your Documentations

Document the identified user experience for the current context under `/context/user-experience`.

Keep your documentation up to date, consistent and accurate.

Use a uniform format for documenting user experience to ensure clarity and consistency.

Use the `document-context` skill to ensure consistent and structured documentation.

## Questions your documentation should answer

- What is the user experience for the current context?
- Are there any ambiguities or incomplete user experience details that need clarification?
- How is the user experience documented and made accessible to all relevant parties?

## Artifacts you should produce

- A comprehensive documentation of the user experience for the current context.
- Records of any clarifications sought from stakeholders regarding ambiguous or incomplete user experience details.
- User Experience Flows documenting the sequence of interactions and experiences for users.
- A list of all user experience diagrams and models used to represent the user experience.

## Scope

Document user goals, actors, journeys, interaction flows, states, accessibility expectations, and UX acceptance needs. Do not duplicate implementation details or technical architecture.

## You do not care about 

- Implementation details that do not impact the user experience.
- Low-level coding standards and practices unless they affect the user experience.
- Specific security configurations unless they influence the user experience.
- Technical requirements unless they influence the user experience.
