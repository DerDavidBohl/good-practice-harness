---
description: Skill to get the current context within this harness. Use it every time you need to understand the current context.
name: get-context
---

# Get Context Skill

Search the `context` directory at the root of the target repository to determine the current context within this harness.

If the directory does not exist, suggest using `onboard-repository`. If onboarding is declined, report that no repository context is available and do not proceed with implementation. Explain that the relevant context must be established first.

Read the context index and its linked specifications to gather the current decision basis. Repository documentation can help locate context specifications and clarify their organization.

Existing context specifications are the decision basis for repository work. Before every implementation change, update the relevant specification to capture the intent and acceptance needs for that requested change, even when existing context covers the general behavior. Do not document implementation details or duplicate records; revise the relevant record where appropriate. When relevant context is missing or contradictory, resolve it before implementation; unrelated gaps do not block the request.

At minimum, inspect the context index and all specifications relevant to the request. Source code, tests, package manifests, and configuration belong to implementation and verification work after the context specifications are established.
