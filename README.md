# Startup Ideation Skills

Hermes Agent skills for turning loose startup ideas into testable problem statements, validation tests, and narrow v1 scopes.

The package deliberately separates the workflow into small composable skills:

- `startup-problem-ledger` — capture raw pains, sharpen them, and decide whether they are startup-shaped.
- `startup-problem-grilling` — stress-test the problem, buyer, distribution, pricing, founder fit, and tarpit risk.
- `startup-validation-test-designer` — design interviews, smoke tests, outreach, paid audits, and kill criteria before building.
- `startup-v1-feasibility` — cut the idea down to a narrow wedge and 2–4 week v1.

## Why this exists

Most startup ideation goes wrong by jumping from a vague frustration to a product idea too quickly. These skills push the agent to slow down, identify who has the problem, what it costs, how people work around it now, who pays, whether the first ten users are reachable, and what evidence would justify building anything.

The useful workflow is not “generate 50 startup ideas”. It is:

```text
Observe pain → log problem → sharpen problem → grill assumptions → design validation test → scope v1 → continue/kill/park
```

## Suggested flow

1. Use `startup-problem-ledger` when the user has a pain, frustration, workflow gap, customer complaint, internal inefficiency, or early startup idea.
2. Use `startup-problem-grilling` to challenge the problem and expose weak assumptions.
3. Use `startup-validation-test-designer` to plan a small evidence-gathering test before building.
4. Use `startup-v1-feasibility` once the problem survives questioning and the user wants to scope a small first version.

## Installation as a Hermes skill tap

This repository is laid out as a skill tap, with skills under `skills/<skill-name>/SKILL.md`.

```bash
hermes skills tap add https://github.com/Forjd/startup-ideation-skills
hermes skills install startup-problem-ledger
hermes skills install startup-problem-grilling
hermes skills install startup-validation-test-designer
hermes skills install startup-v1-feasibility
```

Repository name/URL can be changed after publishing if needed.

## Future candidates

These are deliberately not included as separate skills yet, but may be worth adding later if the workflow grows:

- `startup-interview-synthesis` — turn interview notes/transcripts into comparable evidence.
- `startup-weekly-ideation-review` — review a ledger of ideas, tests, killed ideas, parked ideas, and next actions.

## Licence

MIT © 2026 Forjd.
