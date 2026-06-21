---
name: startup-v1-feasibility
title: Startup V1 Feasibility
description: Scope a startup idea into a 2–4 week v1 that tests the riskiest assumption.
version: 0.1.0
author: Forjd
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [startup, v1, mvp, feasibility, validation, product-scope]
    category: business
    requires_toolsets: []
---

# Startup V1 Feasibility

## When to use

Use when a captured and grilled startup problem looks worth testing and the user wants to decide what to build first.

This skill prevents v1 scope creep. The first version should test the riskiest useful assumption, not become a miniature version of the imagined company.

## Core principle

A good v1 is small enough to build in 2–4 weeks and sharp enough that real user behaviour teaches something.

## Workflow

1. Start from the problem canvas and grilling notes.
2. Identify the riskiest assumption that building can test.
3. Choose a v1 mode: manual concierge, internal tool, workflow wrapper, integration, report, landing page plus manual fulfilment, or narrow SaaS feature.
4. Define the smallest user journey that proves value.
5. List what is explicitly out of scope.
6. Define success and kill criteria before implementation.
7. Produce a 2–4 week build plan only if the scope is credible.

## V1 modes

Prefer boring, fast modes:

- Concierge: user submits input, founder manually produces the outcome.
- Wizard-of-Oz: product interface exists, but fulfilment is manual or semi-manual.
- Report: turn messy inputs into a high-value one-off output.
- Workflow wrapper: connect existing tools and reduce one painful step.
- Narrow automation: automate one repeated task, not the whole job.
- Paid pilot: deliver value for a small number of users before scalable software.

## Feasibility questions

- What single user action starts the workflow?
- What output would make the user say “yes, this helped”?
- Can the user experience be useful with manual work behind the scenes?
- What data, permissions, integrations, or domain expertise are required?
- What is the biggest engineering unknown?
- What can be replaced with a spreadsheet, script, form, email, or admin panel?
- What would make this impossible in 2–4 weeks?
- What would count as a strong signal after 10 users?

## Output format

```markdown
## V1 thesis

If we build [small thing] for [specific user] in [specific moment], we will learn whether [riskiest assumption].

## Recommended v1 mode

[Concierge / Wizard-of-Oz / Report / Workflow wrapper / Narrow automation / Paid pilot]

Why: ...

## Smallest useful user journey

1. ...
2. ...
3. ...

## In scope

- ...

## Out of scope

- ...

## 2–4 week build plan

### Week 1
- ...

### Week 2
- ...

### Optional weeks 3–4
- ...

## Success criteria

- ...

## Kill or rethink criteria

- ...

## Open risks

1. ...
2. ...
3. ...
```

## Pitfalls

- Do not turn v1 into a platform.
- Do not include authentication, billing, teams, dashboards, integrations, or admin tooling unless they are essential to the riskiest test.
- Do not treat “can I build it?” as the only question. The better question is whether the build teaches something commercially useful.
- Do not hide manual fulfilment. Manual is often the fastest way to learn.
