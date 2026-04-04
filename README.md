# Agentic BDD Test Case Mentor

[![Validate Skills](https://github.com/jovd83/agentic-bdd-test-case-mentor/actions/workflows/validate.yml/badge.svg)](https://github.com/jovd83/agentic-bdd-test-case-mentor/actions/workflows/validate.yml)
[![version](https://img.shields.io/badge/version-1.1.0-blue)](CHANGELOG.md)
[![license](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-ffdd00?style=flat&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/jovd83)

Portable Agent Skill for reviewing, rewriting, generating, and formally assessing BDD and Gherkin artifacts.

This repository packages a standards-aligned skill that helps an agent turn weak or ambiguous BDD into clearer, more traceable, business-readable behavior specifications. It is designed for teams that use Gherkin as a collaboration tool, not as a disguised UI automation script.

## What This Skill Does

The skill supports four modes:

- `review`: inspect existing scenarios and feature files, rank findings, and call out gaps
- `rewrite`: improve existing Gherkin while preserving business intent
- `generate`: create new BDD from requirements, examples, rules, or story text
- `hybrid`: combine critique with a corrected replacement

It is especially useful when a user asks for:

- BDD quality review or mentoring
- Gherkin cleanup and rewrite
- traceability and coverage analysis
- coaching-oriented review reports
- scenario generation from acceptance criteria or business rules

## What This Skill Is Responsible For

The skill is responsible for:

- identifying BDD anti-patterns
- checking oracle quality and confidence
- assessing scenario structure and path coverage
- improving business readability and observable outcomes
- generating or rewriting feature files without inventing unsupported metadata
- producing consistent review and report outputs

The skill is not responsible for:

- executing automated tests
- designing framework-specific step definitions
- binding output to Playwright, Cypress, Cucumber, or another runtime
- storing hidden long-term memory
- acting as cross-agent infrastructure

## Design Principles

- Business-readable first: prioritize shared understanding before automation detail.
- Findings before fluff: when reviewing, lead with what is wrong, risky, or missing.
- Explicit confidence: weak source material should reduce certainty, not produce hallucinated precision.
- Minimal hidden behavior: memory is scoped and deliberate.
- Progressive disclosure: `SKILL.md` stays operational, while detailed heuristics and templates live in `references/` and `assets/`.

## Memory Model

The repository uses a deliberately conservative memory model:

- Runtime memory: temporary reasoning for the current task.
- Project-local persistent memory: only when the user explicitly asks for a saved report, checklist, or ledger.
- Shared memory: optional and external to this repository. If needed, integrate via a separate shared-memory skill rather than embedding it here.

Nothing in this skill automatically promotes runtime notes into persistent memory.

## Repository Layout

```text
SKILL.md
README.md
CHANGELOG.md
LICENSE
agents/
`-- openai.yaml
assets/
|-- bdd-feature-template.feature
`-- review-report-template.md
references/
|-- bdd-quality-rules.md
|-- feature-and-scenario-protocol.md
|-- intake-and-decision-flow.md
|-- output-contracts.md
|-- report-rubric.md
`-- review-workflow.md
examples/
|-- formal-report-request.md
|-- generation-source.md
|-- quality-ladder.md
|-- review-input.feature
|-- review-request.md
|-- rewrite-request.md
`-- rewrite-source.feature
eval/
|-- behavior-checklist.md
|-- eval-report-2026-03-26.md
|-- forward-test-matrix.md
`-- trigger-evals.json
scripts/
`-- validate_skill_repo.py
.github/
`-- workflows/
    `-- validate.yml
```

## Installation

Copy this folder into a skills directory that your host scans for Agent Skills.

Common conventions include:

- project-local: `.agents/skills/<skill-name>/`
- user-local: `~/.agents/skills/<skill-name>/`

The only hard requirement is that the skill directory contains a valid `SKILL.md`.

## Quick Start

Example prompts that should trigger this skill:

- `Review this feature file for BDD anti-patterns, missing rule branches, and coverage gaps.`
- `Rewrite these scenarios so they read like business behavior instead of UI steps.`
- `Generate Gherkin from these acceptance criteria for refund eligibility.`
- `Create a formal BDD review report with severity-ranked findings and coaching recommendations.`

Start with:

- [examples/review-request.md](examples/review-request.md)
- [examples/rewrite-request.md](examples/rewrite-request.md)
- [examples/formal-report-request.md](examples/formal-report-request.md)
- [examples/generation-source.md](examples/generation-source.md)

## Output Contracts

The skill exposes four primary response shapes:

- review contract
- rewrite contract
- generate contract
- hybrid contract

Formal report structure and scoring guidance are defined separately.

See:

- [references/output-contracts.md](references/output-contracts.md)
- [references/report-rubric.md](references/report-rubric.md)
- [assets/review-report-template.md](assets/review-report-template.md)

## Validation

This repository includes a repo-local validator so contributors do not need a private toolchain to catch common packaging mistakes.

Run:

```powershell
python scripts/validate_skill_repo.py .
```

What it checks:

- required files and directories exist
- `SKILL.md` frontmatter meets the expected structure
- `agents/openai.yaml` includes the required interface fields
- `eval/trigger-evals.json` is valid and internally consistent
- templates do not force invented tags by default

The repository also includes a GitHub Actions workflow at [.github/workflows/validate.yml](.github/workflows/validate.yml) to run the same validation on push and pull request.

## Evaluation Strategy

The evaluation assets are intentionally lightweight but more rigorous than a single static checklist.

- [eval/trigger-evals.json](eval/trigger-evals.json): trigger and non-trigger prompt coverage
- [eval/forward-evals.json](eval/forward-evals.json): machine-readable forward-test cases with reusable expectations
- [eval/behavior-checklist.md](eval/behavior-checklist.md): behavioral regression checklist
- [eval/forward-test-matrix.md](eval/forward-test-matrix.md): scenario-based forward-test plan
- [eval/eval-report-2026-03-26.md](eval/eval-report-2026-03-26.md): current repository-level evaluation snapshot

## Optional Integrations

Compatible but out of scope for the current implementation:

- shared-memory skill integration for organization-wide conventions
- team-specific metadata schemas for tags or requirement IDs
- custom repository validators or lint rules
- framework-specific handoff patterns for Cucumber, Playwright, or Cypress

These are optional extensions, not built-in behavior.

## Maintainers

Use the validator and the workflow in [scripts/validate_skill_repo.py](scripts/validate_skill_repo.py) and [.github/workflows/validate.yml](.github/workflows/validate.yml) to check packaging and release hygiene.
