# Contributing

Contribute changes that make the skill clearer, safer, more reusable, or easier to validate.

## Contribution Priorities

High-value contributions usually improve one of these areas:

- trigger precision
- instruction clarity
- response contracts
- BDD quality heuristics
- examples that teach the intended behavior
- evaluation assets and maintainability
- packaging, validation, and GitHub readiness

Avoid adding:

- framework lock-in without clear demand
- speculative abstractions
- hidden memory behavior
- invented governance language or unsupported compliance claims
- extra files that do not materially improve usage or maintenance

## Editing Principles

1. Keep `SKILL.md` operational and concise.
2. Move detail into `references/` when it improves progressive disclosure.
3. Keep `assets/` reusable and implementation-agnostic.
4. Prefer explicit contracts over vague advice.
5. Do not teach the model to invent tags, IDs, personas, or business rules.
6. Keep runtime behavior, skill-local persistence, and shared-memory concerns separate.

## Validation Workflow

Run the repo-local validator before opening a PR:

```powershell
python scripts/validate_skill_repo.py .
```

Recommended maintainer checks:

1. Validate the repository structure and metadata.
2. Review [eval/trigger-evals.json](eval/trigger-evals.json) for new trigger regressions.
3. Forward-test at least one prompt from each primary mode:
   - review
   - rewrite
   - generate
   - hybrid or formal report
4. Confirm that weak requirements lower confidence instead of producing false certainty.
5. Confirm that templates and examples still align with the current skill instructions.

If you have access to an external Agent Skills validator, run that too, but the repo should remain self-validating without private tooling.

## Pull Request Checklist

- The trigger description is still accurate and specific.
- `SKILL.md` remains concise and operational.
- New files have a clear maintainer or runtime purpose.
- Templates do not force invented metadata by default.
- Examples still match the documented workflow.
- Evaluation artifacts were updated when behavior changed materially.
- The repo-local validator passes.

## Release Hygiene

For release-worthy changes:

1. update `CHANGELOG.md`
2. re-run validation
3. refresh the eval report if behavior or packaging changed materially
4. confirm `agents/openai.yaml` still matches the skill's purpose and tone
