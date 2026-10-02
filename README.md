# Good Practice Harness

Good Practice Harness is a GitHub Copilot CLI Agent Plugin that provides a structured workflow for turning a repository into a spec-driven repository before implementing changes. The context is the normative specification, and repository content must be based on that context.

## Skills

The plugin includes these skills:

| Skill | Purpose |
| --- | --- |
| `get-context` | Find and read the current repository context. |
| `onboard-repository` | Build a complete context for an existing repository. |
| `context-requirements` | Capture stakeholders and non-technical requirements. |
| `context-architecture` | Identify and document architecture and decisions. |
| `context-coding` | Define coding standards and practices. |
| `context-quality` | Define quality goals, checks, and scenarios. |
| `context-security` | Identify security concerns, assets, and mitigations. |
| `context-user-experience` | Capture user experience flows and expectations. |
| `document-context` | Keep context documentation structured and consistent. |
| `implement-context` | Implement changes based on documented context. |

## Install

Install directly from a local checkout while developing the plugin:

```bash
copilot plugin install /path/to/good-practice-harness
```

After installation, start a new Copilot CLI session or restart the current session to load the skills.

## Use

Ask Copilot to use a skill by name, for example:

```text
Use the onboard-repository skill to document this repository.
```

The skills write context documentation under `/context` in the target repository. The harness expects each context area to maintain a `README.md` and to reference related context where appropriate.

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

Keep skill names lowercase and hyphenated, and keep the `name` and `description` frontmatter fields synchronized with the directory's purpose. Validate the manifest after changes:

```bash
python -m json.tool plugin.json
```

## License

No license is currently declared for this repository.# good-practice-harness