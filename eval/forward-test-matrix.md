# Forward-Test Matrix

Use this matrix when running real prompts against the skill after meaningful changes.
Use [forward-evals.json](forward-evals.json) as the machine-readable companion for repeatable runs.

## Goal

Verify that the skill generalizes on representative user requests without relying on hidden maintainer context.

## Test Cases

### 1. Review mode

- Prompt type: critique an existing feature file
- Minimum source: one weak feature file plus one stronger source-of-truth artifact
- Pass criteria:
  - identifies oracle used
  - ranks material issues by severity
  - calls out coverage gaps
  - avoids inventing metadata

### 2. Rewrite mode

- Prompt type: improve existing scenarios
- Minimum source: one weak scenario set
- Pass criteria:
  - preserves business intent
  - improves naming and observable outcomes
  - removes UI choreography when it is not the business behavior

### 3. Generate mode

- Prompt type: create BDD from acceptance criteria
- Minimum source: user story plus acceptance criteria
- Pass criteria:
  - generates coherent feature structure
  - includes supported main and error paths
  - lists unresolved assumptions instead of inventing missing rules

### 4. Hybrid mode

- Prompt type: review and improve against requirements
- Minimum source: existing draft plus acceptance criteria
- Pass criteria:
  - provides short findings first
  - keeps oracle sufficiency and confidence explicit
  - follows with a corrected artifact
  - keeps blocked decisions explicit

### 5. Formal report mode

- Prompt type: produce a scorecard or executive report
- Minimum source: feature file plus authoritative source material
- Pass criteria:
  - uses the formal report structure
  - distinguishes findings from missing information
  - produces actionable coaching recommendations

## Failure Signals

Treat the run as a failure if the skill:

- claims high confidence from weak source material
- invents tags, IDs, or business rules
- collapses into framework-specific automation design
- buries major issues under generic praise
- produces a rewrite that changes supported business intent without explanation
