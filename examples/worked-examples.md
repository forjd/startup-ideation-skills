# Worked Examples

These examples show the expected evidence-first style. They are intentionally short; real sessions should preserve more exact customer notes and quotes.

## Inventory Before Ledger

Founder context:

```text
I am a web developer who has built Shopify sites, internal dashboards, and client reporting tools for small agencies.
```

Good inventory direction:

```markdown
Idea arenas:
1. Shopify agency operations
2. Client reporting and analytics trust
3. Internal tools for service businesses

Problem inventory:

| Candidate | Customer | Situation | Workaround | Why now | Founder advantage | First validation |
| --- | --- | --- | --- | --- | --- | --- |
| Conversion tracking breaks after theme/app changes | Shopify agencies managing 20-100 stores | Client reports are wrong after app or theme edits | Manual QA, GA4 checks, spreadsheets | More storefront apps, privacy changes, brittle attribution | Built stores and understands tracking breakage | Ask 15 agencies for recent breakage examples and offer a manual audit |
| Retainer clients do not trust monthly reports | Small web agencies | Reporting meetings expose unexplained metric changes | Export screenshots, manual annotations | AI/browser automation can inspect more sources cheaply | Has built dashboards and client reports | Send a sample annotated report to 10 agency owners |
```

Good next step:

- Pick the highest pain candidate and use `startup-problem-ledger`.
- Do not turn the whole inventory into a product roadmap.

## Strong B2B Problem

Raw observation:

```text
Finance teams at 80-300 person SaaS companies rebuild board metrics by hand every month because Stripe, HubSpot, and the warehouse do not reconcile cleanly.
```

Good ledger direction:

```markdown
Problem statement: For finance leads at 80-300 person SaaS companies, month-end board metric packs require manual reconciliation across revenue, CRM, and warehouse data, causing late reporting and confidence risk.
Target user: Head of Finance / FP&A lead
Buyer / budget owner: CFO or VP Finance
Current workaround: Spreadsheet exports, SQL pulls, manual checks, analyst time
Founder advantage: Has built internal reporting tools and understands revenue/CRM data joins
Recent enabling change: Warehouse adoption and automation make a narrow diagnostic cheaper to deliver
Distribution route: Direct outreach to finance leads in 80-300 person SaaS companies
Expansion path: Start with monthly board metrics, then expand into metric definitions, audit trails, and forecast inputs
Evidence collected: Three finance leads described monthly pain; two already pay consultants or analysts to clean the data.
Weakest assumptions: Willingness to pay for a narrow diagnostic; access to enough source data; trust in automated calculations.
Decision gate: Ready to design validation
Next step: Offer a paid manual metrics reconciliation audit to 10 reachable finance leads.
```

Good validation bar:

- Proceed only if finance leads share real source examples, accept a follow-up, or pay for a manual audit.
- Do not proceed from "this sounds useful" alone.

## Weak AI-Shaped Idea

Raw observation:

```text
An AI agent that helps every small business with admin.
```

Good grilling direction:

```markdown
Verdict: Weak until proven

Because: The user, buyer, budget, workflow, urgency, and first reachable segment are all vague. The idea is mostly compelling because AI is fashionable, not because a specific painful workaround has been observed.

Weakest assumptions:
1. Small businesses share one admin problem worth solving.
2. The buyer has budget for a general agent instead of a specific tool or assistant.
3. The founder can reach a narrow segment before building.

Next step: Pick one repeated admin task in one reachable segment, then capture a problem ledger from recent real examples.
```

Good behavior:

- Narrow before validating.
- Ask for recent instances and current workarounds.
- Do not invent a roadmap for a broad agent.

## Sensitive Or Regulated Example

Raw observation:

```text
Clinics want to use AI to summarize patient conversations and flag potential billing codes.
```

Good validation direction:

```markdown
Risk check: High

Reason: The workflow touches health data, clinical conversations, billing, patient trust, and potentially regulated claims.

Validation test: Interview clinic administrators and billing leads about the current billing-code review workflow without collecting patient-identifiable notes.

Guardrails:
- Do not request patient records, recordings, or identifiable examples.
- Do not claim clinical accuracy, compliance status, or billing correctness.
- Ask about workflow, cost, approval process, and existing tools.
- Include legal/domain review before any paid pilot or prototype that handles real patient data.
```

Good behavior:

- Validate the pain and buying process without sensitive data.
- Treat trust, privacy, and compliance as core feasibility risks.
- Do not use fake claims, fake credentials, or undisclosed manual review.
