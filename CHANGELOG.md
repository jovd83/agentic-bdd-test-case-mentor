# Changelog

All notable changes to this repository are documented here.

The format is inspired by Keep a Changelog and the repository uses semantic versioning for public releases.

## [1.0.1] - 2026-04-30

### Changed
- Trim `SKILL.md` frontmatter to fit the 1000-character dispatcher limit (description trim, migrate non-dispatcher fields to body).

## [1.1.0] - 2026-03-26

### Changed

- Rewrote `SKILL.md` into a tighter operating contract with clearer mode selection, oracle handling, confidence rules, guardrails, and response expectations.
- Reworked the supporting references so the repository distinguishes intake, review workflow, quality heuristics, structure rules, scoring, and output contracts more cleanly.
- Upgraded the README and contribution guidance to make the repository more installable, more maintainable, and more GitHub-ready.
- Improved `agents/openai.yaml` so the UI metadata better reflects the skill's purpose and tone.

### Fixed

- Removed contradictory metadata behavior from the feature template by making tags optional instead of implied defaults.
- Corrected example and evaluation guidance so strong artifacts are not forced into artificial findings.
- Tightened repository packaging to align more closely with the Agent Skills specification and current best practices.

### Added

- `references/intake-and-decision-flow.md` for mode selection, oracle sufficiency, and confidence handling.
- `examples/rewrite-request.md`, `examples/rewrite-source.feature`, and `examples/formal-report-request.md` for fuller mode coverage.
- `eval/forward-test-matrix.md` for a clearer maintainer evaluation loop.
- `scripts/validate_skill_repo.py` for deterministic repository validation without private tooling.
- `.github/workflows/validate.yml` for GitHub-side validation on push and pull request.

## [1.0.0] - 2026-03-26

### Added

- Initial public repository packaging
- Core skill instructions and references
- Templates, examples, and basic evaluation artifacts
