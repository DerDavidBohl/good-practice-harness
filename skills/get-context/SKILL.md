---
description: Skill to get the current context within this harness. Use it every time you need to understand the current context.
name: get-context
---

# Get Context Skill

Search the `context` directory at the root of the target repository to determine the current context within this harness.

If the directory does not exist, suggest using `onboard-repository`. If onboarding is declined, report that no repository context is available and request a context specification before implementation.

Read the context index and its linked specifications to gather the current decision basis. Repository documentation can help locate context specifications and clarify their organization.

Existing context specifications are the sole decision basis for repository work. User or stakeholder input enters the decision basis by updating those specifications through the context workflow. When a specification is missing or contradictory, update the context first; implementation waits for the resulting specification.

At minimum, inspect the context index and all specifications relevant to the request. Source code, tests, package manifests, and configuration belong to implementation and verification work after the context specifications are established.
