# What.CD / Gazelle — commit-history provenance audit

Verifies every commit whose **message or content** invokes Gazelle / What.CD against its
actual diff, and classifies the *nature* of each reference. Groundwork for a later study on
What.CD's impact (and the EFF angle) — that measurement is a separate, future task.

## Classification key
- **technosocial** — private-tracker-as-sociotechnical-system; abstract/academic (Latour, Feenberg, "technosocial assemblage"). Not site-specific.
- **private-tracker** — a concrete tracker that is *not* What.CD: the author's own **Stellar** project (Gazelle-based), or a peer site (e.g. PassThePopcorn).
- **What.CD-via-Gazelle** — Gazelle, the open-source CMS What.CD ran on (code, Coding Standards, data model). Open-source; What.CD only as the instance.
- **What.CD-itself** — the specific (defunct) site: its data dump, IRC, interview stats, membership figures, screenshots.

## Commit message audit (message verbatim → veracity vs diff → class)

| Commit | Message | Veracity | Reference class |
|---|---|---|---|
| `7101df7` | reorganize 黒春光琳海 post; restore datadump link + fix what-refuge heading | ✅ accurate | mixed: **technosocial** (PT theory) + **What.CD-itself** (datadump, IRC logs, interview stats) + **What.CD-via-Gazelle** (Coding Standards) |
| `664432b` | fix: place What.CD datadump link in its pp.65–113 placeholder | ✅ | **What.CD-itself** (the released data dump) |
| `97fda5a` | feat: front-page cards…; link What.CD datadump (v0.0.7) | ✅ | **What.CD-itself** (datadump) |
| `8b50900` | Fix broken deploy… restore irc-channels.jpg | ✅ | **What.CD-itself** (its IRC channel list) |
| `91fa766` | Merge stellar.md COLOPHON into 黒春光琳海 post with What.CD assets | ✅ accurate, label slightly broad | **What.CD-itself** (irc/membership/word-cloud) + **What.CD-via-Gazelle** (`gazelle-model.png`) + **private-tracker** (`pass-the-popcorn.jpg` = PTP) |
| `67172a4` | Remove stellar draft and rogue image dir that broke Jekyll build | ✅ | **private-tracker** — "stellar" = author's own project draft |
| `fb81ece` | Add chores doc: stellar-ui logo swap, theme retention, mr-robot rename | ✅ | **private-tracker** — "Stellar"/"stellar-ui" = author's project |
| `aef59c7` | Trim chores: remove PR state narration, tighten logo swap entry | ✅ | **private-tracker** — author's project |

Content-only `-S` hits whose messages make **no** Gazelle/What.CD claim (so no message-veracity
question): `d9cf7e7` (CHANGELOG typos), `5189baa` (ship v0.0.5), `0547db6` (remove playwright),
`2cc9717` (add images/AGENTS.md) — n/a.

## Findings
- **All commit messages are truthful to their diffs.** No message overclaims or misattributes.
- The only nuance is `91fa766`'s "What.CD assets" shorthand covering some Gazelle-codebase and one peer-tracker image. **No history rewrite is warranted** — amending an accurate, already-pushed, deployed-from commit would force a destructive force-push for a cosmetic gain.
- **Key distinction for the study/EFF framing:** the repo cleanly separates (a) the author's **Stellar** project = a generic *private-tracker* implementation on the open-source *Gazelle* codebase, from (b) **What.CD itself**, which appears only as the subject of the essay (its datadump, IRC, stats) — never as something the code reproduces. Gazelle (open-source) is the only What.CD-adjacent artifact actually reused.

_Audit performed 2026-06-04; excluded from the Jekyll build (`docs/`)._
