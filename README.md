> [!IMPORTANT]
>
> ## Compatibility Notice — Antigravity 2.0
>
> Due to breaking changes introduced in **Antigravity v2.0**, the previous skill path conventions used in this repository are no longer compatible.
>
> Some skills may not execute properly until they are migrated to the new structure required by Antigravity 2.0.
>
> ### Current Status
>
> * Legacy structure: ❌ Deprecated
> * Antigravity 2.0 support: 🚧 In Progress
> * Migration guide: Coming soon
>
> ### Repository Status
>
> This repository is no longer actively maintained.
>
> Development has been moved to a new repository with a redesigned structure optimized for Antigravity 2.0 and future multi-agent workflows.
>
> Please follow future updates in the new repository.
>
> Thank you to everyone who supported and used this project.

# pmx-skills

PM workflows, commands, and reusable skills for Gemini CLI.

Inspired by the ideas behind `pm-skills`, this package reimagines product-management workflows as a portable skill system with a Gemini CLI adapter.

🇰🇷 Korean version: [README_KO.md](./README_KO.md)

---

## What this is

`pmx-skills` is a **Product Management workflow package for Gemini CLI**.

Instead of writing one-off prompts every time, you can run structured commands like:

```bash
/pmx:discover
/pmx:prd
/pmx:launch
```

Each command is designed to pull together one or more PM skills so Gemini produces more structured, decision-oriented output.

This package is meant to help with:
- discovery
- research
- strategy
- prioritization
- planning
- delivery
- go-to-market
- growth
- metrics

---

## Why this exists

Most AI usage for PM work starts with blank-page prompting.

That usually creates three problems:
1. outputs are inconsistent
2. important PM steps get skipped
3. good thinking is hard to repeat across projects

`pmx-skills` exists to make PM work more reusable.

It gives you:
- reusable PM skills
- repeatable command workflows
- more explicit assumptions and trade-offs
- outputs that are easier to review and act on

---

## How it works

The package has two layers.

### 1) Commands
Commands are the user-facing entry points under the `/pmx:*` namespace.

Examples:
- `/pmx:discover`
- `/pmx:prd`
- `/pmx:prioritize`

Commands are useful when you want a workflow, not just a generic answer.

### 2) Skills
Skills are reusable PM capabilities under `skills/pmx-*`.

Examples:
- `pmx-discovery`
- `pmx-opportunity-solution-tree`
- `pmx-write-prd`
- `pmx-prioritize-features`

Commands can suggest or bias Gemini toward the right skills for the task.

---

## What is included

This package includes:

- **65 PM skills**
- **36 Gemini CLI commands**
- `gemini-extension.json`
- `GEMINI.md`
- `install.sh` / `uninstall.sh`
- `catalog.json`
- `scripts/validate_package.py`

Structure:

```text
pmx-skills/
├─ commands/pmx/*.toml
├─ skills/pmx-*/SKILL.md
├─ gemini-extension.json
├─ GEMINI.md
├─ install.sh
├─ uninstall.sh
└─ catalog.json
```

---

## Installation

### Global install into your Gemini directory

```bash
./install.sh
```

### Install into a custom Gemini directory

```bash
./install.sh /path/to/.gemini
```

After installation, reload inside Gemini CLI:

```bash
/commands reload
/skills reload
```

### Uninstall

```bash
./uninstall.sh
```

Or uninstall from a custom Gemini directory:

```bash
./uninstall.sh /path/to/.gemini
```

---

## Command guide

Below is the full command set included in this release.

### Discovery and research

#### `/pmx:discover`
Explore a new idea, problem, or opportunity.

Use it when:
- the idea is still vague
- you want to structure early discovery
- you want to turn a rough concept into a clearer PM framing

Example:
```bash
/pmx:discover AI-powered convenience store revenue prediction service
```

#### `/pmx:ost`
Structure thinking with an Opportunity Solution Tree.

Use it when:
- you already have an outcome in mind
- you want to map opportunities, solutions, assumptions, and experiments

Example:
```bash
/pmx:ost Improve repeat usage for a B2B analytics dashboard
```

#### `/pmx:assumptions`
Extract and prioritize assumptions.

Use it when:
- you want to find what must be true
- you need to decide what to validate first

Example:
```bash
/pmx:assumptions Subscription upsell feature for existing power users
```

#### `/pmx:interview`
Generate user interview plans and question sets.

Use it when:
- planning discovery interviews
- validating a problem or concept
- you need a non-leading interview script

Example:
```bash
/pmx:interview Interview store owners about inventory forecasting pain points
```

#### `/pmx:synthesize`
Turn interview or qualitative research into insights.

Use it when:
- you already have notes, quotes, or observations
- you want themes, insights, and product implications

Example:
```bash
/pmx:synthesize Summarize these interview notes about onboarding friction
```

#### `/pmx:segment`
Define customer or user segments.

Use it when:
- deciding who to prioritize
- clarifying segment differences
- shaping product or GTM choices

Example:
```bash
/pmx:segment Segment retail operators for a forecasting SaaS
```

#### `/pmx:journey`
Map the user journey.

Use it when:
- understanding steps, friction, and opportunities
- identifying emotional or process pain points

Example:
```bash
/pmx:journey Map the journey from signup to first successful report
```

#### `/pmx:survey`
Design a survey for a PM question.

Use it when:
- you need structured input from many users
- you want to answer a clearly defined decision question

Example:
```bash
/pmx:survey Design a survey to understand why trial users do not activate
```

#### `/pmx:voice`
Summarize voice-of-customer signals.

Use it when:
- you have reviews, call notes, or interview quotes
- you want pain themes and language patterns

Example:
```bash
/pmx:voice Summarize these support tickets into customer pain themes
```

#### `/pmx:problem`
Tighten a problem statement.

Use it when:
- the team is jumping to solutions too early
- you need a clearer definition of what is wrong and for whom

Example:
```bash
/pmx:problem Define the core problem behind late store restocking decisions
```

#### `/pmx:ideas`
Generate and evaluate idea directions.

Use it when:
- brainstorming possible approaches
- you want options before deciding

Example:
```bash
/pmx:ideas Generate product ideas for reducing reporting workload for franchise HQ
```

### Strategy

#### `/pmx:vision`
Draft product vision and strategic direction.

Use it when:
- clarifying long-term direction
- aligning the team around what the product should become

Example:
```bash
/pmx:vision Define a product vision for retail operations intelligence
```

#### `/pmx:positioning`
Create value proposition and positioning.

Use it when:
- refining how to describe the product
- clarifying audience, category, and differentiation

Example:
```bash
/pmx:positioning Position a B2B analytics product for franchise operators
```

#### `/pmx:okrs`
Set OKRs and supporting success measures.

Use it when:
- translating strategy into measurable outcomes
- aligning teams around objectives and key results

Example:
```bash
/pmx:okrs Define OKRs for increasing weekly active usage
```

#### `/pmx:nsm`
Define a North Star Metric and supporting metrics.

Use it when:
- choosing the best top-level success metric
- connecting user value to measurement

Example:
```bash
/pmx:nsm Define a North Star Metric for a forecasting dashboard
```

#### `/pmx:business-model`
Explore business model, pricing, or market-entry implications.

Use it when:
- assessing monetization direction
- thinking about channels, revenue, and market approach

Example:
```bash
/pmx:business-model Evaluate the business model for a multi-tenant analytics SaaS
```

#### `/pmx:strategy-options`
Compare strategic options.

Use it when:
- you have multiple possible paths
- you need a recommendation with trade-offs

Example:
```bash
/pmx:strategy-options Compare SMB-first vs enterprise-first expansion
```

#### `/pmx:roadmap`
Create a roadmap and explain sequencing.

Use it when:
- planning future work
- aligning initiatives to themes and timing

Example:
```bash
/pmx:roadmap Create a 2-quarter roadmap for retail forecasting product
```

#### `/pmx:competition`
Think through market-entry or competitive angle.

Use it when:
- evaluating alternatives in the market
- shaping strategic differentiation

Example:
```bash
/pmx:competition Compare our analytics product angle against existing BI tools
```

### Prioritization and planning

#### `/pmx:prioritize`
Prioritize features or initiatives.

Use it when:
- deciding what to build next
- comparing effort, value, and confidence

Example:
```bash
/pmx:prioritize Prioritize backlog items for Q3
```

#### `/pmx:cost-benefit`
Compare benefits and costs.

Use it when:
- evaluating trade-offs more explicitly
- presenting a recommendation to stakeholders

Example:
```bash
/pmx:cost-benefit Compare in-house forecasting engine vs external vendor
```

#### `/pmx:scope`
Define initiative scope.

Use it when:
- clarifying in-scope vs out-of-scope
- preventing ambiguity before delivery

Example:
```bash
/pmx:scope Define scope for the store-level anomaly alerts feature
```

#### `/pmx:sprint`
Plan sprint work and capacity.

Use it when:
- turning goals into realistic near-term work
- checking capacity, dependencies, and risks

Example:
```bash
/pmx:sprint Plan the next sprint for onboarding improvements
```

#### `/pmx:release`
Plan an upcoming release.

Use it when:
- deciding release scope and readiness
- preparing rollout details

Example:
```bash
/pmx:release Plan the release for smart reorder recommendations
```

#### `/pmx:dependencies`
Map delivery dependencies.

Use it when:
- identifying blockers
- understanding critical path and ownership

Example:
```bash
/pmx:dependencies Map dependencies for the Q4 launch plan
```

### Delivery and execution

#### `/pmx:prd`
Generate a PRD and requirement structure.

Use it when:
- documenting a feature or initiative
- aligning stakeholders before execution

Example:
```bash
/pmx:prd Smart notification system to reduce alert fatigue
```

#### `/pmx:stories`
Create user stories and task breakdowns.

Use it when:
- preparing work for engineering or design
- turning scope into delivery-ready items

Example:
```bash
/pmx:stories Break down onboarding checklist redesign into user stories
```

#### `/pmx:status`
Write a stakeholder update or project status report.

Use it when:
- reporting progress
- summarizing risks, next steps, and asks

Example:
```bash
/pmx:status Create a weekly update for the forecasting initiative
```

#### `/pmx:launch-check`
Create launch readiness checklists.

Use it when:
- preparing a feature or product for release
- you need cross-functional readiness visibility

Example:
```bash
/pmx:launch-check Build a launch readiness checklist for v1 mobile release
```

#### `/pmx:retro`
Run a retrospective.

Use it when:
- after a sprint, launch, or project phase
- capturing improvements and action items

Example:
```bash
/pmx:retro Run a retrospective on the onboarding redesign sprint
```

### GTM, growth, and analytics

#### `/pmx:gtm`
Plan go-to-market strategy.

Use it when:
- launching a feature
- defining channels, messaging, and target audience

Example:
```bash
/pmx:gtm Go-to-market plan for predictive restocking alerts
```

#### `/pmx:launch`
Create a cross-functional launch plan.

Use it when:
- coordinating product, marketing, sales, support, and ops
- turning GTM into concrete milestones

Example:
```bash
/pmx:launch Launch plan for subscription upsell to existing customers
```

#### `/pmx:growth`
Analyze growth loops, activation, or onboarding.

Use it when:
- trying to increase activation or self-propelled growth
- diagnosing weak handoffs in early lifecycle

Example:
```bash
/pmx:growth Improve activation for new trial users
```

#### `/pmx:funnel`
Analyze funnel performance.

Use it when:
- investigating conversion drop-offs
- prioritizing funnel improvements

Example:
```bash
/pmx:funnel Analyze drop-offs from signup to first successful forecast
```

#### `/pmx:pricing`
Think through pricing direction.

Use it when:
- exploring package design
- comparing monetization approaches

Example:
```bash
/pmx:pricing Design an initial pricing model for a multi-store analytics tool
```

#### `/pmx:validate`
Validate an idea or plan through evidence and experiments.

Use it when:
- you want a recommendation to test, refine, or stop
- moving from idea to evidence

Example:
```bash
/pmx:validate Evaluate whether automated reorder suggestions are worth validating
```

#### `/pmx:metrics`
Define and refine KPI structures.

Use it when:
- selecting success metrics
- designing ongoing measurement

Example:
```bash
/pmx:metrics Define KPIs for the first 90 days after launch
```

---

## Skills

The package includes 65 PM skills. They cover areas such as:

- discovery
- problem framing
- interviews and synthesis
- segmentation and journeys
- strategy and vision
- metrics and OKRs
- prioritization
- PRDs and requirements
- sprint and release planning
- GTM and growth

You can browse the full list in:
- `catalog.json`
- `skills/`

---

## Example usage patterns

### Turn a vague idea into structured discovery
```bash
/pmx:discover Build an AI product for retail operators
```

### Convert a concept into a documented feature spec
```bash
/pmx:prd Create a PRD for daily stock anomaly detection
```

### Decide what to build next
```bash
/pmx:prioritize Compare alert tuning, mobile dashboard, and automated reorder suggestions
```

### Prepare for launch
```bash
/pmx:launch Plan launch for premium analytics tier
```

---

## Language

- Core package language: English
- Korean input works well in practice for many workflows

---

## Notes

This package is designed to be:
- installable
- reusable
- structured
- easier to evolve than ad-hoc prompts

It is not presented as a byte-for-byte mirror of any upstream project.

---

## License

MIT

---

## 🤝 Acknowledgements

Inspired by [pm-skills](https://github.com/phuryn/pm-skills),  
originally designed for Claude Code.

This project reinterprets the concept for Gemini CLI,  
focusing on structured workflows, portability, and practical PM thinking.
