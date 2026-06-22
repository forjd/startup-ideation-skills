# Startup Ideation Skills

Evidence-first Agent Skills for turning raw startup observations into sharper problems, validation tests, interview synthesis, and narrow first versions.

They are built for agents that should behave less like idea generators and more like practical founder thought partners: slow down, capture the pain, test the assumptions, and only scope a v1 when there is enough evidence.

```text
Observe pain -> inventory problems -> log one problem -> grill assumptions
-> scan public X signals -> test demand -> synthesize evidence -> scope v1 or park it
```

Built by Forjd. MIT licensed.

## How To Use

Install the pack in your agent, then name the skill in your prompt and paste the raw material you have. The agent loads the matching `SKILL.md` workflow and uses it to structure the session.

| Runtime | Prompt style |
| --- | --- |
| OpenAI Codex | `$startup-problem-inventory Find startup problem candidates from my background...` |
| Claude Code | `/startup-ideation-skills:startup-problem-inventory Find startup problem candidates...` |
| Hermes or other Agent Skills runtimes | `Use startup-problem-inventory to find startup problem candidates...` |

Start with `startup-problem-inventory` if you are still exploring. Start with `startup-problem-ledger` if you already have one concrete pain to capture.

## Skill Map

| Stage | Skill | Use it when... | What it returns |
| --- | --- | --- | --- |
| 1 | `startup-problem-inventory` | You have founder context, domain observations, customer complaints, or messy workflows and want candidates. | Problem arenas, scored candidates, best ledger picks, unknowns, evidence packet seed. |
| 2 | `startup-problem-ledger` | You have one raw pain, annoyance, workflow gap, or early idea. | A structured problem entry, sharper problem statement, unknowns, next questions. |
| 3 | `startup-problem-grilling` | You want to stress-test the problem before designing a test or building. | Weak assumptions, buyer map, tarpit risk, founder fit, validation moves, verdict. |
| 4 | `startup-public-x-signal-scan` | You need to inspect public X conversations before choosing a test or outreach angle. | Signal scan plan, search angles, evidence table, confidence limits, validation next steps. |
| 5 | `startup-validation-test-designer` | You need the smallest credible demand test. | Test plan, hypothesis, target users, outreach angle, pass/fail criteria, what to record. |
| 6 | `startup-interview-synthesis` | You have interview notes, replies, calls, or validation results. | Evidence summary, contradictions, signal strength, follow-ups, proceed/park/kill decision. |
| 7 | `startup-v1-feasibility` | Evidence is strong enough to consider a small first version. | Narrow wedge, v1 mode, scope cuts, 2-4 week plan, success and rethink criteria. |

The skills are designed as a chain, but each one works on its own:

```text
startup-problem-inventory
-> startup-problem-ledger
-> startup-problem-grilling
-> startup-public-x-signal-scan
-> startup-validation-test-designer
-> startup-interview-synthesis
-> startup-v1-feasibility
```

The chain should carry forward an evidence packet: problem statement, target user, buyer, workaround, founder advantage, recent enabling change, distribution route, expansion path, evidence collected, weakest assumptions, decision gate, and next step.

`startup-v1-feasibility` should return `Not build-ready` when the packet does not contain credible validation evidence from real prospects.

## HTML Artifacts

Markdown in chat remains the default output. Each skill can also create a formatted single-file HTML artifact when you ask for an artifact, report, visual summary, printable version, or single-file HTML file.

Example prompt:

```text
$startup-interview-synthesis
Synthesize these validation notes and also create a single-file HTML artifact.
```

The HTML artifact should be self-contained, use inline CSS only, preserve the same evidence and recommendations as the Markdown output, include a source skill/date footer, and be designed for quick visual review or printing.

## Roleplay Scenarios

### 1. You have founder experience, but no clear idea

```text
You:
$startup-problem-inventory
I spent five years running operations for boutique law firms. Teams kept
copying client intake details between email, case management, and billing.

Agent:
I will map your unfair access first, then produce problem arenas, a scored
inventory, the best candidates to log, the biggest unknowns, and an evidence
packet seed for the strongest problem.
```

### 2. You spotted one painful workflow

```text
You:
$startup-problem-ledger
Conveyancing teams waste hours chasing inconsistent source-of-funds evidence
from clients before exchange.

Agent:
I will capture the raw observation before turning it into a product idea:
who feels the pain, when it happens, the workaround, frequency, cost,
buyer, alternatives, founder advantage, and the next validation step.
```

### 3. You are getting excited and need resistance

```text
You:
$startup-problem-grilling
Here is the ledger entry. Challenge it before I build anything.

Agent:
I will pressure-test problem reality, buyer urgency, budget, reachability,
tarpit risk, timing, founder fit, and whether building is the right next move.
```

### 4. You need public signals before outreach

```text
You:
$startup-public-x-signal-scan
Scan public X signals for finance founders complaining about month-end close
workflows before I write outreach.

Agent:
I will define source-truth boundaries, turn public posts into weak or strong
signal classes, separate language from demand, and return validation questions
for the next real-user test.
```

### 5. You need a test, not a roadmap

```text
You:
$startup-validation-test-designer
Design a one-week validation test. I can reach 20 operations managers on
LinkedIn and 5 warm contacts.

Agent:
I will pick the riskiest assumption, choose a small test, write non-leading
questions or outreach, define strong and weak signals, and set kill criteria.
```

### 6. You have evidence and need a decision

```text
You:
$startup-interview-synthesis
Here are notes from eight calls, three replies, and one paid audit.

Agent:
I will separate behaviour from compliments, map evidence by assumption,
surface contradictions, and recommend proceed, park, or kill.
```

### 7. You want to build the smallest useful thing

```text
You:
$startup-v1-feasibility
The synthesis says proceed. Cut this down to a 2-4 week v1 with manual
steps allowed.

Agent:
I will choose a narrow wedge, pick a boring first-version mode, cut scope,
and return a build plan only if the evidence is strong enough.
```

## Installation

### skills.sh

```bash
npx skills add forjd/startup-ideation-skills --skill '*'
```

```bash
bunx skills add forjd/startup-ideation-skills --skill '*'
```

Install one skill by replacing `'*'` with a skill name:

```bash
npx skills add forjd/startup-ideation-skills --skill startup-problem-inventory
```

Use `-g` for a global install, or `--agent <agent-name>` to target a supported agent. Set `DISABLE_TELEMETRY=1` to opt out of skills.sh CLI telemetry.

### OpenAI Codex

```bash
codex plugin marketplace add forjd/startup-ideation-skills
codex plugin add startup-ideation-skills@startup-ideation-skills
```

Then start a new Codex session and mention a skill by name:

```text
$startup-problem-inventory Help me find startup problem candidates from my experience building internal tools for finance teams.
```

### Claude Code

```text
/plugin marketplace add forjd/startup-ideation-skills
/plugin install startup-ideation-skills@startup-ideation-skills
/reload-plugins
```

Then call a namespaced skill:

```text
/startup-ideation-skills:startup-problem-inventory
```

### Hermes Agent

```bash
hermes skills tap add https://github.com/forjd/startup-ideation-skills
hermes skills install startup-problem-inventory
hermes skills install startup-problem-ledger
hermes skills install startup-problem-grilling
hermes skills install startup-validation-test-designer
hermes skills install startup-interview-synthesis
hermes skills install startup-v1-feasibility
```

### Direct Agent Skills Layout

The canonical format is:

```text
skills/<skill-name>/SKILL.md
```

Clone this repository and point any Agent Skills-compatible runtime at `skills/`, or copy only the folders you want.

## What This Is Not

This is not a polished startup idea generator.

It will not produce a long list of plausible SaaS concepts and pretend they are opportunities. The point is to help an agent inventory raw problems, identify reachable users and buyers, test demand cheaply, and avoid building the wrong thing.

## Repository

```text
skills/                         # Canonical Agent Skills
.codex-plugin/plugin.json       # OpenAI Codex plugin manifest
.agents/plugins/marketplace.json # OpenAI Codex repo marketplace entry
.claude-plugin/                 # Claude Code plugin and marketplace metadata
examples/worked-examples.md     # Example runs
script/validate                 # Local validation
script/release                  # Version bump, release commit, and tag helper
```

Useful examples:

- [Worked examples](examples/worked-examples.md)
- [Skill index](skills/README.md)
- [Codex marketplace version note](docs/codex-marketplace-version-null.md)

## Contributing

Good contributions make the agent more concrete, more sceptical, or more useful in real founder workflows: better question banks, sharper anti-patterns, more realistic examples, or compatibility fixes for Agent Skills runtimes.

Before opening a PR or publishing a release, run:

```bash
script/validate
```

For releases, update package metadata and pinned marketplace refs with:

```bash
script/release X.Y.Z
```

## License

MIT (c) 2026 Forjd. See [LICENSE](LICENSE).
