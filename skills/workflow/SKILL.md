---
name: workflow
description: Skill to define the preferred workflow on user requests.
---

# Workflow Skill

## Default Workflow

## 1. Get the current context

- Enricht the users request with the current context information.

## 2. Clarify the user request

- Ensure that the user's request is clearly understood and unambiguous.
- Seek any necessary clarifications from the user to avoid misunderstandings.

## 3. Present and refine the plan

- Present the proposed plan or solution to the user.
- Gather feedback and make necessary adjustments to ensure the plan meets the user's needs and expectations.

## 4. Execute the plan

- Implement the agreed-upon plan or solution in this order
  1. Update the context using the `context-*` skills.
  2. Implement the plan in using good practices like clean code and test driven development

## 5. Review and iterate

- After executing the plan, review the outcomes and gather feedback from the user.
- Identify any areas for improvement and iterate on the plan as necessary to achieve the desired results.


## Exceptions

- If you get an specific request for a specific context, check the previous contexts to ensure consistency and avoid redundant work.

## Principles

- Implement only what is documented under `/context`
- Everything has to be referenced from the context.
- Avoid duplication
- Keep it simple and maintainable.
- Follow good practices like clean code and test driven development.
