# Startup Ideation Skills

Open source Hermes Agent skills for turning startup ideas into clearer problems, validation tests, and narrow first versions.

This repository is for people who want an AI agent to be useful during early-stage startup thinking without becoming a hype machine. The skills push the agent to slow down, capture the pain properly, question the assumptions, design evidence-gathering tests, and only then scope a small v1.

MIT licensed. Built by Forjd.

## Why this exists

Most startup ideation goes wrong by jumping from a vague frustration to a product idea too quickly.

The useful workflow is not:

```text
Generate 50 startup ideas → pick the one that sounds exciting → build too much
```

It is closer to:

```text
Observe pain → log problem → sharpen problem → grill assumptions → design validation test → scope v1 → continue/kill/park
```

These skills are designed to make that second workflow easier to run with Hermes Agent.

They focus on practical questions:

- Who has the problem?
- When does it happen?
- What is the current workaround?
- What does doing nothing cost?
- Who pays?
- What alternatives already exist?
- Why now?
- Can you reach 10 real users?
- Can you test demand before building?
- Could a useful v1 be built in 2–4 weeks?

## Skills included

### `startup-problem-ledger`

Capture raw observations before they turn into premature product ideas.

Use it for annoyances, repeated manual tasks, customer complaints, workflow gaps, internal inefficiencies, market oddities, or early startup ideas.

It records the raw observation, context, user, job, obstacle, workaround, cost, frequency, emotional intensity, potential buyer, alternatives, and next validation step.

### `startup-problem-grilling`

Stress-test a captured problem.

This is the anti-delusion skill. It questions the problem, buyer, budget, distribution, willingness to pay, founder-market fit, tarpit risk, and whether building is actually the right next step.

It is deliberately sceptical, but not cynical. A small useful business can pass. A vague AI-shaped idea with no buyer should not.

### `startup-validation-test-designer`

Design the smallest credible validation test before building.

It can help plan customer interviews, direct outreach, smoke tests, fake doors, demo videos, paid audits, manual services, concierge tests, and pass/fail criteria.

It also blocks weak customer discovery questions such as “Would you use this?” and pushes towards evidence from real behaviour.

### `startup-v1-feasibility`

Cut an idea down to a narrow wedge and a 2–4 week v1.

It helps identify the smallest useful workflow, what can be manual, what should be out of scope, and what the first version needs to teach commercially.

The default bias is towards boring, fast v1 modes: concierge, Wizard-of-Oz, reports, workflow wrappers, narrow automation, diagnostics, and paid pilots.

## Suggested workflow

Use the skills as a chain:

```text
startup-problem-ledger
→ startup-problem-grilling
→ startup-validation-test-designer
→ startup-v1-feasibility
```

A typical session might look like this:

1. Capture a raw pain or idea with `startup-problem-ledger`.
2. Challenge it with `startup-problem-grilling`.
3. If it survives, design a test with `startup-validation-test-designer`.
4. If the test creates enough signal, scope a small v1 with `startup-v1-feasibility`.

You can also use each skill on its own.

## Installation

This repository is compatible with Hermes Agent, OpenAI Codex plugins, and Claude Code plugins.

### Hermes Agent

This repository is laid out as a Hermes skill tap. Skills live under `skills/<skill-name>/SKILL.md`.

Add the tap:

```bash
hermes skills tap add https://github.com/Forjd/startup-ideation-skills
```

Install the skills you want:

```bash
hermes skills install startup-problem-ledger
hermes skills install startup-problem-grilling
hermes skills install startup-validation-test-designer
hermes skills install startup-v1-feasibility
```

Depending on where Hermes is running, you may need to start a new session or restart the gateway before newly installed skills are available.

### OpenAI Codex

This repository includes a Codex plugin manifest at `.codex-plugin/plugin.json` and a repo marketplace entry at `.agents/plugins/marketplace.json`.

Add the marketplace:

```bash
codex plugin marketplace add forjd/startup-ideation-skills
```

Install the plugin:

```bash
codex plugin add startup-ideation-skills@startup-ideation-skills
```

You can also browse and install it from the Codex plugin UI:

```bash
codex /plugins
```

Codex can then invoke the bundled skills when relevant, or you can explicitly mention them with `$startup-problem-ledger`, `$startup-problem-grilling`, `$startup-validation-test-designer`, or `$startup-v1-feasibility`.

### Claude Code

This repository includes a Claude Code plugin manifest at `.claude-plugin/plugin.json` and a marketplace file at `.claude-plugin/marketplace.json`.

Add the marketplace:

```text
/plugin marketplace add forjd/startup-ideation-skills
```

Install the plugin:

```text
/plugin install startup-ideation-skills@startup-ideation-skills
```

Claude Code plugin skills are namespaced by the plugin name. You can invoke them as:

```text
/startup-ideation-skills:startup-problem-ledger
/startup-ideation-skills:startup-problem-grilling
/startup-ideation-skills:startup-validation-test-designer
/startup-ideation-skills:startup-v1-feasibility
```

Run `/reload-plugins` or restart Claude Code if newly installed plugin skills do not appear immediately.

## Example prompts

```text
Use startup-problem-ledger to capture this: conveyancing teams waste time chasing inconsistent source-of-funds evidence from clients.
```

```text
Use startup-problem-grilling to challenge this problem before I build anything.
```

```text
Use startup-validation-test-designer to create a two-week validation plan for this idea.
```

```text
Use startup-v1-feasibility to cut this down to a 2–4 week v1 with manual steps allowed.
```

## What this is not

This is not a startup idea generator.

It will not try to produce a long list of plausible-sounding SaaS concepts. The goal is to help an agent think more like a practical founder: find a painful problem, identify a reachable user and buyer, test demand cheaply, and avoid building the wrong thing.

## Repository structure

```text
.
├── .agents
│   └── plugins
│       └── marketplace.json          # OpenAI Codex repo marketplace entry
├── .claude-plugin
│   ├── marketplace.json              # Claude Code marketplace entry
│   └── plugin.json                   # Claude Code plugin manifest
├── .codex-plugin
│   └── plugin.json                   # OpenAI Codex plugin manifest
├── LICENSE
├── README.md
└── skills
    ├── README.md
    ├── startup-problem-ledger
    │   └── SKILL.md
    ├── startup-problem-grilling
    │   └── SKILL.md
    ├── startup-validation-test-designer
    │   └── SKILL.md
    └── startup-v1-feasibility
        └── SKILL.md
```

## Future ideas

Possible future skills:

- `startup-interview-synthesis` — turn interview notes or transcripts into comparable evidence.
- `startup-weekly-ideation-review` — review a ledger of ideas, validation tests, killed ideas, parked ideas, and next actions.
- `startup-market-map` — map incumbents, point solutions, manual services, and wedge opportunities.

## Contributing

Contributions are welcome.

Useful contributions include:

- Better question banks.
- More examples from real founder workflows.
- Sharper anti-patterns and tarpit checks.
- Improvements to the validation and v1 scoping templates.
- New skills that fit the same practical, evidence-first style.

Please keep additions concrete. The goal is not more startup jargon; it is better agent behaviour.

## Licence

MIT © 2026 Forjd. See [LICENSE](LICENSE).
