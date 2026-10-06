# Good Practice Harness

Good Practice Harness is a GitHub Copilot CLI Agent Plugin that provides a structured workflow for turning a repository into a spec-driven repository before implementing changes. The context is the normative specification, and repository content must be based on that context.

## Skills

The plugin includes these skills:

| Skill | Purpose |
| --- | --- |
| `get-context` | Find and read the current repository context. |
| `onboard-repository` | Build context and identify or create repository-specific verification checks. |
| `context-requirements` | Capture stakeholders and non-technical requirements. |
| `context-architecture` | Identify and document architecture and decisions. |
| `context-coding` | Define coding standards and practices. |
| `context-quality` | Define quality goals and guide agent-led, repository-specific verification. |
| `context-security` | Identify security concerns, assets, and mitigations. |
| `context-user-experience` | Capture user experience flows and expectations. |
| `document-context` | Keep context documentation structured and consistent. |
| `make-change` | Implement requested changes using the documented repository context. |
| `workflow` | Coordinate the preferred workflow for repository requests. |

## Install

Install directly from a local checkout while developing the plugin:

```bash
copilot plugin install /path/to/good-practice-harness
```

After installation, start a new Copilot CLI session or restart the current session to load the skills.

## Use

For a repository without `/context`, start by onboarding:

```text
Use the onboard-repository skill to document this repository.
```

For ordinary repository requests, use the workflow orchestrator:

```text
Use the workflow skill to fix the validation error in the configuration parser.
```

`workflow` reads the relevant repository context, asks only for blocking clarifications, and coordinates implementation and verification through `make-change`. Focused skills can also be invoked directly for scoped context work. If onboarding is declined or no relevant context exists, implementation does not proceed until that context is established. Context updates record changes to intended behavior or constraints, not implementation details or work already covered by existing records.

## Plugin layout

Agent Plugins 1.0 discovers skills from immediate subdirectories of `skills/` containing a `SKILL.md` file. The manifest is at the repository root:

```text
plugin.json
README.md
skills/
  context-architecture/SKILL.md
  context-coding/SKILL.md
  ...
```

## Development

Keep skill names lowercase and hyphenated, and keep the `name` and `description` frontmatter fields synchronized with the directory's purpose. Run the harness checks after changes (requires `jq`):

```bash
jq empty plugin.json
bash skills/document-context/scripts/test_harness.sh
```

## License

No license is currently declared for this repository.