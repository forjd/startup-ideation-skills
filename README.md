# Startup Ideation Skills

Open source Agent Skills for turning startup ideas into clearer problems, validation tests, and narrow first versions.

This repository follows the Agent Skills open standard: each skill is a directory with a `SKILL.md` file containing reusable instructions and metadata. The same skill content can be used across compatible agent runtimes, with packaging metadata included for Hermes Agent, OpenAI Codex, and Claude Code.

It is for people who want an AI agent to be useful during early-stage startup thinking without becoming a hype machine. The skills push the agent to slow down, capture the pain properly, question the assumptions, design evidence-gathering tests, and only then scope a small v1.

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

These skills are designed to make that second workflow easier to run in any agent that supports reusable skills.

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

## Compatibility

The canonical skill format is the open Agent Skills layout:

```text
skills/<skill-name>/SKILL.md
```

This repository also includes runtime-specific packaging files so the same skills can be installed through several agent ecosystems:

- Hermes Agent skill tap: `skills/`
- OpenAI Codex plugin: `.codex-plugin/plugin.json`
- OpenAI Codex repo marketplace: `.agents/plugins/marketplace.json`
- Claude Code plugin: `.claude-plugin/plugin.json`
- Claude Code marketplace: `.claude-plugin/marketplace.json`

The skill instructions themselves are not tied to a single agent product.

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
4. If the test creates enough behavioural signal from real prospects, scope a small v1 with `startup-v1-feasibility`.

You can also use each skill on its own.

Each step should carry forward an evidence packet with the current problem statement, target user, buyer, workaround, evidence collected, weakest assumptions, decision gate, and next step. The v1 skill should return `Not build-ready` rather than a build plan when that packet does not contain credible validation evidence.

## Installation

Install the pack through the software you use. The same four skill folders are packaged for each supported runtime.

| If you use... | Install path |
| --- | --- |
| OpenAI Codex | Codex plugin marketplace |
| Claude Code | Claude Code plugin marketplace |
| Hermes Agent | Hermes skill tap |
| Another Agent Skills-compatible runtime | Copy or reference the `skills/` folders directly |

<details open>
<summary><strong>OpenAI Codex</strong> - plugin marketplace</summary>

**Prerequisites:** Codex with plugin support enabled.

**Install:**

Add this repository as a Codex plugin marketplace:

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

**Verify:**

Start a new Codex session and ask for one of the skills explicitly:

```text
$startup-problem-ledger Capture this: finance teams keep rebuilding the same monthly board metrics by hand.
```

Codex should load the skill from this plugin. If it does not appear, restart Codex and check the plugin is installed in `/plugins`.

**Use:**

Mention any bundled skill by name:

```text
$startup-problem-ledger
$startup-problem-grilling
$startup-validation-test-designer
$startup-v1-feasibility
```

</details>

<details>
<summary><strong>Claude Code</strong> - plugin marketplace</summary>

**Prerequisites:** Claude Code with `/plugin` commands available.

**Install:**

Add this repository as a Claude Code plugin marketplace:

```text
/plugin marketplace add forjd/startup-ideation-skills
```

Install the plugin:

```text
/plugin install startup-ideation-skills@startup-ideation-skills
```

Reload plugins or restart Claude Code:

```text
/reload-plugins
```

**Verify:**

Run one of the installed plugin skills:

```text
/startup-ideation-skills:startup-problem-ledger
```

If Claude Code says the command is unknown, restart Claude Code and confirm the plugin appears in the plugin list.

**Use:**

Claude Code plugin skills are namespaced by the plugin name:

```text
/startup-ideation-skills:startup-problem-ledger
/startup-ideation-skills:startup-problem-grilling
/startup-ideation-skills:startup-validation-test-designer
/startup-ideation-skills:startup-v1-feasibility
```

</details>

<details>
<summary><strong>Hermes Agent</strong> - skill tap</summary>

**Prerequisites:** Hermes Agent with skill taps enabled.

**Install:**

Add this repository as a skill tap:

```bash
hermes skills tap add https://github.com/forjd/startup-ideation-skills
```

Install the skills you want:

```bash
hermes skills install startup-problem-ledger
hermes skills install startup-problem-grilling
hermes skills install startup-validation-test-designer
hermes skills install startup-v1-feasibility
```

**Verify:**

Start a new Hermes session and ask for one of the installed skills:

```text
Use startup-problem-ledger to capture this: customer success managers are manually reconciling renewal risk notes across tools.
```

If the skill is not found, restart the Hermes gateway or the agent session so newly installed skills are loaded.

</details>

<details>
<summary><strong>Any Agent Skills-compatible runtime</strong> - direct folders</summary>

**Prerequisites:** An agent runtime that can load skills from the open Agent Skills directory layout.

**Install:**

Clone the repository:

```bash
git clone https://github.com/forjd/startup-ideation-skills.git
```

Point your agent at the `skills/` directory, or copy only the skill folders you want into your runtime's skills directory:

```text
skills/startup-problem-ledger/SKILL.md
skills/startup-problem-grilling/SKILL.md
skills/startup-validation-test-designer/SKILL.md
skills/startup-v1-feasibility/SKILL.md
```

**Verify:**

Ask your agent to use one skill by its folder name:

```text
Use startup-validation-test-designer to design a one-week demand test for this idea.
```

</details>

## Versioning and release pins

The package version is declared in `.codex-plugin/plugin.json` and `.claude-plugin/plugin.json`, then mirrored in the marketplace manifests. Individual `SKILL.md` files intentionally do not carry top-level version fields; this keeps skill frontmatter compatible with strict Agent Skills validators.

Marketplace entries are pinned to release tags such as `v0.1.1` instead of `main` so installs are reproducible. When publishing a new release, update the package version, update marketplace refs to the matching `vX.Y.Z` tag, commit, tag that commit, and push both the branch and tag.

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
├── .github
│   └── workflows
│       └── validate.yml               # Skill and package validation
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
├── script
│   ├── validate                      # Local validation entrypoint
│   └── validate_skills.rb            # Repo-specific skill/package checks
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
- Compatibility improvements for other Agent Skills runtimes.

Please keep additions concrete. The goal is not more startup jargon; it is better agent behaviour.

Before opening a PR or publishing a release, run:

```bash
script/validate
```

The default validation checks whitespace, JSON manifests, skill frontmatter, skill index coverage, version consistency, release-pinned marketplace refs, and Claude plugin validation when the `claude` CLI is available.

After pushing the matching release tag, you can also run the isolated Codex install smoke test:

```bash
RUN_CODEX_INSTALL_SMOKE=1 script/validate
```

## Licence

MIT © 2026 Forjd. See [LICENSE](LICENSE).
