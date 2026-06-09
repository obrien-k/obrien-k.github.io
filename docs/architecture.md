# Architecture Overview & v0.1.0 Plan

Status: **planning** — captured 2026-06-09, pre-v0.1.0. No implementation yet.
Scope: the custom layer over the **free** `jekyll-theme-hydejack` v9.2.1 gem.

This document is the think-through that was deferred through the v0.0.x series. It
records the current state, the root causes behind the "too many repeated systems"
and "light vs dark mismatch" feelings, the decisions made, and the sequenced plan
toward the v0.1.0 release.

---

## 1. Current state

### 1.1 Taxonomy — five overlapping systems

The duplication is real. The same concept ("Code") lives in three places, and two
more systems sit alongside:

| System | Where | Status |
|---|---|---|
| `featured_categories` collection | `_featured_categories/code.md` → `/code/` | 1 file only; `layout: list` |
| Hand-rolled per-tag pages | `tags/<name>/index.md` (9) → `/tags/code/` | manual, `hidden: true` |
| Global tags page | `tags.md` → `/tags/` | auto-lists `site.tags` |
| `featured_tags` collection | `_config.yml` (`/tag-:name/`) | **dead config — zero content files** |
| Post front matter | `categories:` + `tags:` | the actual source of truth |

**Vocabulary drift.** 2020+ posts use a tight 9-tag set matching the index pages
(`narrative, code, programming, career-path, startup, personal,
artificial-intelligence, productivity, satire`). The **2018 posts carry ~17 orphan
tags** with no index pages and inconsistent naming:
`wuubi, google, mozilla, web-browser` (vs category `web-browsers`),
`google-chrome, puzzles, hardware, audio, mp3, sound, cli, ide, modern-slavery,
prison-strike, racial-justice, introduction, tutorial`. These came from the old
wuu.bi / Ghost export and were never reconciled to the strict vocabulary.

### 1.2 Theming — root cause of the light/dark mismatch

`_sass/frutiger-aqua.scss` is a **two-skin engine** driven by CSS custom properties
that flip per mode:
- **Dark** (`body.dark-mode` + `@media prefers-color-scheme: dark`): vaporwave —
  magenta `225 0 255` / cyan, flat 16-bit panels.
- **Light** (default `body`): Frutiger Aero — aqua `#0099cc` / sky, glass panels.

Loaded via `_sass/my-style.scss` (a thin shim the gem hard-imports; the filename is
fixed by Hydejack and must not be renamed).

The mismatch is a **copy-pasted hardcoded palette**. These four colors are pasted
into three pages instead of using the shared tokens:

```
#ff5ad9 (pink)  #a071ff (purple)  #9a93b3 (dim)  #473a63 (line)
→ leadership-philosophy.md, vanity-house.md, listen-to-this-album.md
```

- **Resume** uses the shared `--accent-rgb` / `--accent2-rgb` tokens → flips correctly.
- The **other two pages stay pink/purple** in both skins.

So in **dark** all three harmonize (pink/purple sit fine next to vaporwave magenta);
in **light**, Resume flips to aqua while the other two stay pink → the trio diverges.
**Fix = lift those 4 colors to the shared tokens.** One change fixes the mismatch and
deletes the triplicated palette.

### 1.3 Jekyll-convention check

Idiomatic: gem theme + local overrides (`home`, `archive`, `resume`), collections,
the `my-style` shim. Not idiomatic:
- **Hand-rolled per-tag `index.md` pages** — this is what `jekyll-archives`
  auto-generates from front matter. Hand-maintaining them is the drift source.
- **`featured_tags` collection is dead config** — defined, never used. Delete.
- Stale comment: `code.md` says `list`/`grid` are "PRO only", but `list.html` ships
  in the free gem (`…/jekyll-theme-hydejack-9.2.1/_layouts/list.html`).

---

## 2. Decisions (2026-06-09)

1. **Greyscale a11y** → a **separate high-contrast/greyscale mode**, not a replacement
   for the light skin. The Frutiger Aero aqua light identity stays; greyscale is an
   additional opt-in for users who need it. Does **not** touch dark vaporwave.
2. **Taxonomy** → adopt **`jekyll-archives`** to auto-generate tag + category pages;
   retire the 9 hand-rolled tag pages and the dead `featured_tags` collection; then
   normalize the 2018 vocabulary to a canonical set.
3. **v0.1.0 scope** → all of: theming consolidation, taxonomy consolidation,
   skin-registry refactor, and persisting this overview.

---

## 3. v0.1.0 plan (sequenced)

Ordering: theming-token lift first (unblocks skin registry), then skin registry,
then taxonomy, then the page-specific rustic/greyscale work last.

### WS-A — Theming token consolidation
- Replace the four hardcoded hex values in `leadership-philosophy.md`,
  `vanity-house.md`, `listen-to-this-album.md` with the shared CSS custom properties
  (`--accent-rgb`, `--accent2-rgb`, plus new `--dim` / `--line` tokens defined per
  skin in `frutiger-aqua.scss`).
- Verify all three custom pages + Resume now flip together in both skins.

### WS-B — Skin-registry refactor
- Formalize the two-skin engine into a registry: `_data/skins.yml` + one SCSS partial
  per skin, each honoring the same token contract (`--accent-rgb`, `--accent2-rgb`,
  `--panel-*`, `--dim`, `--line`, …), selected by a body class.
- This is an **in-repo refactor, not a greenfield project**. It does not belong in
  `resume` (LaTeX) or `ghost-2-jekyll` (importer) — different domains. Could later
  graduate to its own SCSS gem if reused across sites; premature for now.
- Add the **greyscale/high-contrast skin** as a registry entry + toggle (decision #1).

### WS-C — Taxonomy consolidation
- Add `jekyll-archives`; configure tag + category page generation.
- Delete the 9 `tags/<name>/index.md` pages and the `featured_tags` collection config.
- Decide the fate of `_featured_categories/code.md` and `tags.md` once archives
  generate the canonical pages.
- **Normalize 2018 vocabulary** to the canonical tag set. The old posts came through
  the Ghost export, so the durable fix is upstream in **`ghost-2-jekyll`** (tentatively
  → `archive-2-md`): map/merge the orphan tags there so re-imports stay clean, then
  reflect the canonical set in this repo.
- **Archive page** (`/archive/`, `_layouts/archive.html`) is the front door for the
  normalized taxonomy — make it the v0.1.0 focus once tags are clean.

### WS-D — Leadership Philosophy: rustic / coffee-stain
- Apply a skeuomorphic/rustic treatment (parchment, sepia, torn-edge) via CSS, using
  shared skin tokens so it respects light/dark + greyscale.
- **Coffee stains:** Jekyll **cannot** run the LaTeX `coffeestains` package — KaTeX
  renders math LaTeX only; `coffeestains` is a TikZ/pgf package needing a full
  pdfLaTeX compile. Options:
  - (a) CSS/SVG/PNG stain overlay — recommended for the web, skin-aware, lightweight.
  - (b) Real LaTeX in **`~/git/resume`** (exists) — compile a `coffeestains` doc,
    export PNG/SVG, embed. Only path that uses the actual package.
  - (c) `ghost-2-jekyll` — not applicable (it's an importer, not a renderer).

---

## 4. External / cross-repo dependencies

- **`ghost-2-jekyll`** (tentatively `archive-2-md`) — external Ghost→Jekyll importer.
  Owns the upstream normalization of the 2018 wuu.bi vocabulary (WS-C).
- **`~/git/resume`** — LaTeX resume pipeline; only viable home for real `coffeestains`
  output (WS-D, option b).
