# Behavior Checklist

Use this checklist when validating a change to the skill.

## Trigger behavior

- The skill triggers for BDD review, rewrite, generation, and formal report prompts.
- The skill does not trigger for generic testing, framework automation, or unrelated engineering tasks.

## Intake behavior

- The skill names the oracle sources it used.
- The skill reports oracle sufficiency as strong, partial, or weak when it matters.
- The skill lowers confidence when the source of truth is incomplete.
- The skill does not invent unsupported business rules or metadata.

## Review behavior

- The skill returns findings first for review requests.
- The skill separates confirmed defects from assumptions or missing information.
- The skill ranks material findings by severity.
- The skill flags UI-scripted Gherkin, mixed branches, and vague outcomes.
- The skill can say `No material defects identified` when the artifact is strong.

## Rewrite behavior

- The skill preserves business intent.
- The skill improves scenario naming and observable outcomes.
- The skill splits overloaded scenarios.
- The skill does not add implementation details unless explicitly requested.

## Generation behavior

- The skill starts from business rules, acceptance criteria, or examples rather than automation steps.
- The skill includes the main business path when the source supports it.
- The skill adds alternate or error paths only when they are supported by the source.
- The skill marks unresolved assumptions and missing rule branches explicitly.

## Hybrid and report behavior

- The skill keeps oracle sufficiency and confidence explicit in `hybrid` responses.
- The skill uses the formal report structure only when the user asks for a formal report, scorecard, or executive summary.

## Boundary behavior

- The skill does not create hidden persistent memory.
- The skill keeps project-local persistence explicit and user-directed.
- The skill treats shared memory as an external integration boundary.
- The skill stays portable across Agent Skills compatible hosts.
