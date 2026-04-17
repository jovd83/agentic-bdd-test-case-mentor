---
name: agentic-bdd-test-case-mentor
description: Review, rewrite, generate, and formally assess BDD or Gherkin feature files, scenarios, and scenario outlines from user stories, acceptance criteria, business rules, feature drafts, or example maps. Use when Codex needs to identify BDD anti-patterns, traceability or coverage gaps, weak Given-When-Then structure, overloaded scenarios, missing rule branches, or coaching-oriented improvements without drifting into framework-specific automation design.
license: MIT
metadata:
  version: 1.0.0
  dispatcher-layer: execution
  dispatcher-lifecycle: active
  dispatcher-output-artifacts: bdd_review, improved_feature_file, coaching_report
  dispatcher-risk: low
  dispatcher-writes-files: 'true'
  dispatcher-input-artifacts: requirements, acceptance_criteria, bdd_feature, example_map
  dispatcher-capabilities: bdd-review, bdd-generation, gherkin-mentoring
  dispatcher-stack-tags: testing, bdd, gherkin
  dispatcher-accepted-intents: review_bdd_test_cases, generate_bdd_test_cases, rewrite_bdd_test_cases
  dispatcher-category: testing
---

# Agentic BDD Test Case Mentor

Use this skill to improve the quality, clarity, and reviewability of BDD artifacts while keeping the output business-readable and traceable to the source of truth.

## Telemetry & Logging

> [!IMPORTANT]
> All usage of this skill must be logged via the Skill Dispatcher to ensure audit logs and wallboard analytics are accurate:
> `python scripts/dispatch_logger.py --skill <skill_name> --intent <intent> --reason <reason>`

## 1. Establish the operating mode

Classify the task as one of these modes before producing the response:

- `review`: critique existing BDD, rank issues, assess coverage, or produce a report
- `rewrite`: improve existing Gherkin while preserving the intended behavior
- `generate`: create new BDD from requirements, rules, examples, or narrative source material
- `hybrid`: combine findings with a corrected replacement

Use `hybrid` when the user wants both an assessment and an improved artifact.

State the selected mode at the start of the response when it would not be obvious from context.

## 2. Capture the source of truth before judging correctness

Use the strongest available oracle in this order:

1. business rules
2. acceptance criteria
3. user stories
4. feature text or scenario text
5. stakeholder notes

Always do these steps:

- name the oracle sources that were provided
- distinguish strong, partial, and weak oracle coverage
- separate confirmed behavior from assumptions
- review wording and BDD structure even when the oracle is weak
- avoid claiming business correctness when the source of truth is incomplete or ambiguous

Never invent:

- requirement IDs
- personas
- tags
- priorities
- business rules
- policy limits
- framework semantics

Read [references/intake-and-decision-flow.md](references/intake-and-decision-flow.md) when the request is ambiguous, the oracle is incomplete, or the correct mode is not obvious.

## 3. Load the right supporting references

Keep `SKILL.md` as the operating contract. Load additional references only when they materially improve the answer.

- Read [references/review-workflow.md](references/review-workflow.md) for formal, high-confidence, or findings-first reviews.
- Read [references/bdd-quality-rules.md](references/bdd-quality-rules.md) for anti-pattern detection, rewrite heuristics, and quality checks.
- Read [references/feature-and-scenario-protocol.md](references/feature-and-scenario-protocol.md) for `Feature:`, `Rule:`, `Background:`, `Scenario Outline`, tags, naming, and path coverage guidance.
- Read [references/report-rubric.md](references/report-rubric.md) when the user asks for a score, executive summary, or formal report.
- Read [references/output-contracts.md](references/output-contracts.md) when the response needs a more explicit structure than the default flow.

## 4. Apply the universal guardrails

Treat BDD as business-readable behavioral specification.

Always:

- prefer business behavior over UI choreography
- keep one behavior path per scenario
- keep one main event in `When`
- make `Then` externally observable
- keep `Given` minimal but sufficient
- use concrete domain examples when the source supports them
- flag blocked decisions instead of smoothing them over
- keep traceability explicit when the source provides it

Do not:

- turn Gherkin into test-script narration
- mix unrelated rule branches in one scenario
- fabricate metadata to make the artifact look complete
- overstate confidence when the oracle is weak
- add implementation details unless the user explicitly needs them and the behavior cannot be understood without them

## 5. Run `review` mode

In `review` mode:

1. assess artifact intent and scope
2. assess traceability to the source of truth
3. assess scenario architecture, naming, grouping, and duplication
4. assess path coverage:
   - main path
   - alternate path
   - error path
   - persona, permission, boundary, or lifecycle coverage when relevant
5. assess BDD quality:
   - business language
   - observable outcomes
   - concrete examples
   - absence of UI scripting
   - absence of mixed branches
6. rank findings as `Critical`, `Major`, or `Minor`

Default to findings-first output.

If the artifact is strong, say `No material defects identified` instead of inventing weak findings.

## 6. Run `rewrite` mode

In `rewrite` mode:

1. preserve business intent
2. improve titles so they describe the condition and the outcome
3. split overloaded scenarios into one behavior path per scenario
4. replace UI steps with business behavior unless the UI interaction is itself the rule under test
5. replace vague outcomes with externally visible outcomes
6. replace generic placeholders with realistic examples when the source supports them
7. keep unsupported metadata as an explicit gap rather than inventing it

Use [assets/bdd-feature-template.feature](assets/bdd-feature-template.feature) when the user asks for a full feature file.

## 7. Run `generate` mode

In `generate` mode:

1. start from rules, decisions, and examples rather than automation steps
2. draft a feature narrative only when the source supports it
3. map the rule space into main, alternate, and error behavior where supported
4. generate one scenario per behavior path or rule branch
5. prefer concrete roles, dates, states, amounts, and domain language
6. stop and mark the gap when the source is too incomplete for reliable generation

If the source is partial but still usable, generate only the supported behaviors and list the unresolved gaps separately.

## 8. Run `hybrid` mode

In `hybrid` mode:

1. keep the findings section short and focused on the most material issues
2. provide the improved artifact immediately after the findings
3. keep unresolved assumptions or blocked decisions explicit

Use `hybrid` instead of forcing the user to choose between critique and a useful replacement.

## 9. Use the correct response contract

Use the default response shape below unless the user explicitly asks for a formal report.

- `review`: mode, oracle used, confidence, severity-ranked findings, coverage and traceability notes, top recommendations
- `rewrite`: mode, rewrite strategy, revised artifact, open assumptions
- `generate`: mode, source inputs, generated artifact, assumptions and gaps
- `hybrid`: mode, oracle used, oracle sufficiency, confidence, key findings, rewritten artifact, open assumptions

Read [references/output-contracts.md](references/output-contracts.md) when a stricter structure is needed.

If the user explicitly asks for a formal review report, scorecard, or executive summary:

- use [references/report-rubric.md](references/report-rubric.md)
- use [assets/review-report-template.md](assets/review-report-template.md)

## 10. Keep memory scoped and explicit

Use memory deliberately:

- runtime memory: working notes and judgments for the current task only
- project-local persistent memory: create only when the user explicitly asks for a saved checklist, report, or review ledger
- shared memory: treat as an external integration boundary and use only when the host workflow explicitly provides it

Do not automatically promote runtime observations into project-local or shared memory.

## 11. Handle failure cases cleanly

When the task is under-specified, degrade gracefully:

- weak oracle: review structure and BDD quality, but lower confidence and avoid correctness claims
- mixed behaviors in one scenario: split them and explain why
- vague outcomes: replace them with observable results or flag the missing business outcome
- excessive feature scope: recommend splitting by capability, rule set, persona, or lifecycle phase
- missing metadata: keep the gap explicit instead of fabricating tags or IDs

## 12. Follow the bundled examples

Use the examples under `examples/` to stay consistent with the repository's intended style.

- [examples/review-request.md](examples/review-request.md)
- [examples/rewrite-request.md](examples/rewrite-request.md)
- [examples/formal-report-request.md](examples/formal-report-request.md)
- [examples/generation-source.md](examples/generation-source.md)
- [examples/quality-ladder.md](examples/quality-ladder.md)

## 13. Gotchas

Avoid these common mistakes while using this skill:

- **The "Automation Handoff" Trap**: Do not suggest framework-specific code (Cucumber, Playwright, etc.) unless explicitly requested. This skill is for _business-readable BDD_, not test automation scripts.
- **The "Hallucination" Pitfall**: Do not invent requirement IDs, personas, or business rules that are not in the source material. If they are missing, call it out as a gap rather than fabricating "professional-looking" metadata.
- **The "Over-Correction" Bias**: If the user provides a well-structured artifact, do not invent findings just to have something to say. Say "No material defects identified" and focus on refinement instead.
- **The "Missing Context" Blind Spot**: Do not assume a scenario is correct just because it is well-written. Always verify it against the strongest available oracle.
- **The "Scope Creep" Drift**: Do not try to solve or generate an entire feature if the user only asked for a review of specific scenarios or rules. Focus on the requested scope.

## 14. Resource map

- Intake and mode selection: [references/intake-and-decision-flow.md](references/intake-and-decision-flow.md)
- Formal review sequence: [references/review-workflow.md](references/review-workflow.md)
- Quality heuristics: [references/bdd-quality-rules.md](references/bdd-quality-rules.md)
- Structure protocol: [references/feature-and-scenario-protocol.md](references/feature-and-scenario-protocol.md)
- Report rubric: [references/report-rubric.md](references/report-rubric.md)
- Response contracts: [references/output-contracts.md](references/output-contracts.md)
- Feature template: [assets/bdd-feature-template.feature](assets/bdd-feature-template.feature)
- Formal report template: [assets/review-report-template.md](assets/review-report-template.md)
