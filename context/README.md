# Repository Context

This directory is the normative specification for Good Practice Harness. Repository changes are expected to follow the applicable context records; implementation details remain outside this directory.

## Context Areas

- [Requirements](requirements/README.md): stakeholders, goals, and acceptance needs.
- [Architecture](architecture/README.md): system boundaries, capability organization, and decisions.
- [Security](security/README.md): trust boundaries, assets, threats, and security expectations.
- [User Experience](user-experience/README.md): user goals and skill interaction expectations.
- [Quality](quality/README.md): quality attributes and verification expectations.
- [Coding](coding/README.md): implementation and documentation conventions.

All six areas apply to this repository. Cross-area references should use stable record IDs, with each area's overview serving as its navigation index.

## Open Clarifications

- Distribution and licensing expectations are not specified; the current repository documentation says no license is declared.
- Security expectations beyond normal local developer trust, especially for secrets and repositories from untrusted sources, are not specified.
- Supported Copilot CLI/plugin versions and compatibility policy are not specified.

The stakeholder baseline for this onboarding is plugin maintainers and AI coding tool users. The intended workflow requires complete, validated context before implementation. Repository content is treated with normal local developer trust. See the relevant context records for scope and assumptions.