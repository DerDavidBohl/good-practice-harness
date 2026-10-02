---
name: context-security
description: Skill to identify and document the security aspects for the current context.
---

# Security Skill

Identify the security aspects for the current context.

Ask for clarification from stakeholders whenever the security aspects are ambiguous or incomplete.

Document all gathered security information and decisions clearly and ensure it is accessible to all relevant parties.

## Dependent contexts

- `/context/requirements` (if the security aspects depend on specific requirements)
- `/context/architecture` (if the security aspects depend on the architecture i. e. the used technologies and design decisions)
- `/context/user-experience` (if the security aspects depend on the user experience)

Evaluate security after requirements and architecture are available. A missing security detail blocks work only when the requested change affects a security-sensitive asset or trust boundary.

## Your Documentations

Document the identified security aspects for the current context under `/context/security`.

Keep your documentation up to date, consistent and accurate.

Use a uniform format for documenting security aspects to ensure clarity and consistency.

Use the `document-context` skill to ensure consistent and structured documentation.

## Questions your documentation should answer

- What are the security aspects for the current context?
- Are there any ambiguities or incomplete security details that need clarification?
- How are the security aspects documented and made accessible to all relevant parties?

## Artifacts you should produce

- A comprehensive documentation of the security aspects for the current context.
- A classification of data and assets based on their security requirements.
- Security policies and procedures relevant to the current context.
- Risk assessments and mitigation plans addressing identified security threats.

## You do not care about 

- Implementation details that do not impact security.
- Low-level coding standards and practices unless they affect security.
- Specific security configurations that are not relevant to the current context.
- User experience flows unless they influence security considerations.

## Scope

Document intended assets, trust boundaries, threats, vulnerabilities, controls, policies, and residual risk. Do not include implementation observations, source-code references, current behavior, or conformance assessments. Do not duplicate unrelated infrastructure or application configuration.
