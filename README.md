# Startup Ideation Skills

Hermes Agent skills for turning loose startup ideas into testable problem statements.

The package deliberately separates the workflow into small skills:

- `startup-problem-capture` — capture a raw pain/problem in a consistent format.
- `startup-problem-grilling` — question the assumptions hard before treating it as an opportunity.
- `startup-v1-feasibility` — decide whether a useful v1 can be built and tested in 2–4 weeks.

## Why this exists

Most startup ideation goes wrong by jumping from a vague frustration to a product idea too quickly. These skills push the agent to slow down, identify who has the problem, what it costs, how people work around it now, who pays, and whether the first ten users are realistically reachable.

## Suggested flow

1. Use `startup-problem-capture` when the user has a pain, frustration, workflow gap, or early startup idea.
2. Use `startup-problem-grilling` to stress-test the problem and expose weak assumptions.
3. Use `startup-v1-feasibility` once the problem survives questioning and the user wants to scope a small first version.

## Installation as a Hermes skill tap

This repository is laid out as a skill tap, with skills under `skills/<skill-name>/SKILL.md`.

```bash
hermes skills tap add https://github.com/Forjd/startup-ideation-skills
hermes skills install startup-problem-capture
hermes skills install startup-problem-grilling
hermes skills install startup-v1-feasibility
```

Repository name/URL can be changed after publishing if needed.

## Licence

MIT © 2026 Forjd.
