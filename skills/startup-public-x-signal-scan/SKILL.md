---
name: startup-public-x-signal-scan
description: Scan authorized public X conversations with Xquik source truth before startup validation, turning posts, profiles, complaints, keywords, and competitor mentions into evidence limits, search angles, validation questions, and a next-step gate.
license: MIT
metadata:
  display_name: Startup Public X Signal Scan
  hermes:
    tags: [startup, validation, public-signals, x, customer-discovery]
    category: business
    requires_toolsets: []
---

# Startup Public X Signal Scan

## When to use

Use after a problem has been inventoried, logged, or grilled and the founder
wants public X evidence before writing outreach, choosing interview targets, or
designing a validation test.

This skill does not prove demand. It turns public X chatter into better search
angles, language, segments, objections, and validation questions.

## Source truth

If the user wants an executable Xquik workflow, check the public Xquik sources
before naming commands, endpoints, fields, or install steps:

- API overview: `https://docs.xquik.com/api-reference/overview`
- OpenAPI schema: `https://xquik.com/openapi.json`
- MCP overview: `https://docs.xquik.com/mcp/overview`
- Package source: `https://github.com/Xquik-dev/x-twitter-scraper`
- Package snippet: `npm install x-twitter-scraper@0.3.3`

If Xquik access is not available, still design the scan and ask the user to
paste exported public results, post links, profile notes, or keyword samples.

## Inputs to request if missing

Ask only for the missing inputs needed to make the scan useful:

```markdown
Problem statement:
Target user or buyer:
Current workaround:
Riskiest assumption:
Candidate keywords, phrases, profiles, competitors, or communities:
Geography or language constraints:
Time window:
Existing evidence packet:
Whether Xquik API, SDK, MCP, or exported results are available:
```

## Workflow

1. Restate the validation question in one sentence.
2. Decide what public X can and cannot answer for this question.
3. Build 5-10 search angles from pain language, workaround words, competitor
   names, job titles, events, regulation changes, and failure phrases.
4. If Xquik is available, choose only documented public Xquik surfaces from the
   source-truth list. Do not invent endpoints, fields, limits, or auth flows.
5. Classify results by segment, pain, workaround, urgency, objection, and
   behaviour. Treat likes, reposts, and vague complaints as weak signals.
6. Extract exact language that can improve outreach or interview questions.
7. List contradictions and missing buyer evidence.
8. Decide whether the next step is interviews, direct outreach, a smoke test, a
   narrower scan, or parking the idea.

## Signal quality

Strong public X signals:

- A buyer or reachable user describes a recent painful workflow.
- Multiple posts name the same workaround, failed tool, or expensive manual step.
- Someone asks for recommendations, alternatives, templates, consultants, or
  implementation help around the problem.
- A competitor or adjacent tool thread exposes concrete objections.
- A public conversation points to reachable interview targets.

Weak public X signals:

- Generic complaints with no workflow detail.
- Viral engagement without buyer identity.
- Founder or vendor posts that only promote a product.
- One-off opinions with no behaviour, cost, frequency, or workaround.
- Broad trend chatter that does not name who suffers or pays.

## Guardrails

- Use only authorized public X data.
- Do not ask for cookies, private account access, scraped private content, or
  secrets.
- Do not bypass login, rate limits, privacy boundaries, or platform rules.
- Do not treat social attention as validation by itself.
- Do not claim market size, ranking, completeness, or freshness unless the
  supplied data proves it.
- Do not include private implementation details about Xquik.
- Keep unsupported Xquik requests out of the output and offer a documented path.

## Optional HTML artifact

Default to Markdown chat output. If the user asks for an artifact, report,
visual summary, printable version, or single-file HTML file, also create a
standalone `.html` file when filesystem access is available.

For the HTML artifact:

- Use one self-contained file with inline CSS only.
- Preserve the same evidence, source links, signal classes, and next steps as
  the Markdown output.
- HTML-escape user-provided text and do not execute or embed user-provided HTML
  or script.
- Include the source skill name and generation date in small footer text.
- Name the file `startup-public-x-signal-scan-YYYY-MM-DD.html`.

## Output format

```markdown
## Public X signal scan

Validation question: ...

Xquik source check: [Not used / API docs checked / OpenAPI checked / MCP docs checked / Exported results provided]

Verdict: [Useful for outreach language / Useful for interview targeting / Too weak / Needs narrower scan / Park]

## Search angles

| Angle | Query or target | Why it matters | Expected signal |
| --- | --- | --- | --- |
| ... | ... | ... | ... |

## Evidence table

| Source | Segment | Quote or behaviour | Signal strength | Supports | Concern |
| --- | --- | --- | --- | --- | --- |
| ... | ... | ... | Strong / Mixed / Weak / Noise | ... | ... |

## Language to reuse

- Pain words:
- Workaround words:
- Objection words:
- Buyer words:

## What public X cannot prove

- ...

## Validation next steps

1. ...
2. ...
3. ...

## Evidence packet update

Stage: Public X signal scan
Problem statement: ...
Target user: ...
Buyer / budget owner: ...
Current workaround: ...
Recent enabling change: ...
Distribution route: ...
Evidence collected: ...
Weakest assumptions: ...
Decision gate: [Run interviews / Design smoke test / Narrow scan / Park]
Next step: ...
```

## Anti-patterns

- Do not produce a product roadmap from public X posts.
- Do not count posts from vendors as customer demand.
- Do not smooth away contradictions between buyer, user, and vendor language.
- Do not recommend v1 scoping from public X signals alone.
