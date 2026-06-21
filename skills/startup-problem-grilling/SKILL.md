---
name: startup-problem-grilling
title: Startup Problem Grilling
description: Stress-test a captured startup problem with sharp questions before product scoping.
version: 0.1.0
author: Forjd
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [startup, ideation, validation, customer-discovery, critique]
    category: business
    requires_toolsets: []
---

# Startup Problem Grilling

## When to use

Use after a startup problem has been captured, or when the user asks whether a business idea is worth pursuing.

This skill is deliberately sceptical. The goal is not to kill ideas for sport; it is to find the fragile assumptions before the user spends weeks building the wrong thing.

## Stance

Be direct, practical, and specific. Question the problem, buyer, urgency, reachability, and build scope. Avoid generic startup theatre.

## Inputs to request if missing

Ask for the captured problem canvas if it is not already in context:

```markdown
Problem:
Who has it:
When it happens:
Current workaround:
Cost of the problem:
How often it happens:
Who pays:
Existing alternatives:
Why now:
Could I reach 10 users:
Could I build v1 in 2–4 weeks:
```

## Grilling workflow

1. Restate the problem in its strongest concrete form.
2. Identify the weakest 3–5 assumptions.
3. Ask hard questions grouped by theme.
4. Separate `problem risk`, `market risk`, `reach risk`, `willingness-to-pay risk`, and `build risk`.
5. Suggest small validation moves that do not require building the full product.
6. End with a verdict: `Promising`, `Needs narrowing`, `Weak until proven`, or `Probably not worth building yet`.

## Question bank

### Problem reality

- Is this painful enough that people already spend time, money, or political capital on it?
- What happens if they ignore it?
- Is it a frequent problem, a severe problem, or neither?
- Is the pain felt by the same person who would approve a fix?

### Current workaround

- What spreadsheet, Slack ritual, outsourced labour, internal tool, or manual review exists today?
- Why have existing tools not solved it?
- Is the workaround hated, or merely untidy?
- Would the buyer prefer a better process over another piece of software?

### Buyer and budget

- Who owns the budget?
- What budget line would this come from?
- Is the cost visible enough for someone to justify paying?
- Would this be bought by an individual, team lead, department, or company?

### Existing alternatives

- What would they search for if they wanted to solve it today?
- Which boring incumbent is already close enough?
- Could an agency, Zapier workflow, VA, spreadsheet, or LLM prompt solve 80% of it?
- What would make switching worth the bother?

### Reachability

- Can the user name 10 people or organisations to contact?
- Is there a community, marketplace, job title, search query, association, or LinkedIn filter that exposes these users?
- Would these people talk about the problem, or is it private/sensitive?
- Can outreach happen before anything is built?

### Timing

- Why now?
- What changed in regulation, technology, behaviour, cost pressure, AI capability, or market structure?
- Is this a new problem, or an old problem with a newly cheap solution?

### V1 feasibility

- What is the smallest thing that proves value?
- Can the first version be concierge/manual behind the scenes?
- What can be faked, scripted, or done with off-the-shelf tools?
- What must be true for a 2–4 week build to be meaningful?

## Output format

```markdown
## Strongest version of the problem

...

## Weakest assumptions

1. ...
2. ...
3. ...

## Grilling questions

### Problem risk
n. ...

### Buyer / willingness-to-pay risk
n. ...

### Reach risk
n. ...

### Build risk
n. ...

## Fast validation moves

1. ...
2. ...
3. ...

## Verdict

[Promising / Needs narrowing / Weak until proven / Probably not worth building yet]

Because: ...
```

## Pitfalls

- Do not become a cheerleader. If it is vague, say it is vague.
- Do not require venture-scale potential. A small useful business can still pass.
- Do not over-index on TAM. Early evidence from real reachable users matters more.
- Do not suggest building as the default next step when interviews, landing pages, manual fulfilment, or paid pilots would answer the bigger risk faster.
