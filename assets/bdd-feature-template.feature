# Replace every placeholder before use.
# Keep only the sections that the source material supports.
# Uncomment optional tags only when the project already defines them.

Feature: <capability-focused title>
  As a <persona>
  I want <capability>
  So that <business value>

  # Rule: <business rule name>

  # Optional metadata:
  # @requirement-<id>
  # @persona-<role>
  # @main
  Scenario: <condition and observable outcome>
    Given <minimal business context>
    When <user or external action>
    Then <observable business outcome>

  # Optional alternate or rejection path:
  # @alt
  Scenario: <alternate valid outcome>
    Given <minimal business context>
    When <alternate valid action or condition>
    Then <observable alternate outcome>

  # Optional invalid or blocked path:
  # @error
  Scenario: <blocked or invalid path>
    Given <minimal business context>
    When <invalid or blocked action>
    Then <observable rejection or failure outcome>

  # Optional outline when every row follows the same rule shape:
  # Scenario Outline: <same rule with parameterized examples>
  #   Given <minimal business context with <parameter>>
  #   When <action>
  #   Then <observable outcome>
  #
  #   Examples:
  #     | parameter |
  #     | value-1   |
  #     | value-2   |
