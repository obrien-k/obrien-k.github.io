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
3. **v0.1.0 scope** → theming consolidation (done), a11y overlay + toggle,
   taxonomy consolidation, skin registry + Anorex (WS-E).

---

## 3. v0.1.0 plan (sequenced)

Ordering: theming-token lift first (done), then a11y overlay + toggle, then
taxonomy, then the page-specific rustic/greyscale work last.

### WS-A — Theming token consolidation
- Replace the four hardcoded hex values in `leadership-philosophy.md`,
  `vanity-house.md`, `listen-to-this-album.md` with the shared CSS custom properties
  (`--accent-rgb`, `--accent2-rgb`, plus new `--dim` / `--line` tokens defined per
  skin in `frutiger-aqua.scss`).
- Verify all three custom pages + Resume now flip together in both skins.

### WS-B — A11y overlay + toggle

**Decided (2026-06-09, post gem-spelunking):** originally deferred, then
re-scoped: a11y overlay only, no registry. Registry reinstated in WS-E (below)
once a third skin (Anorex) appeared as a concrete use-case. WS-B scope:

- Add `body.a11y-mode` block to `frutiger-aqua.scss` — re-maps `--accent-rgb`,
  `--accent2-rgb`, and surface tokens to neutral greys; drops `--page-bg` to
  `none`. Also handle `body.dark-mode.a11y-mode` combo. ~35 lines total.
- Copy `a11y.png` (or equivalent icon) from assets into the Jekyll site.
- Inject a second `nav-btn` into `.nav-btn-bar` (next to Hydejack's brightness
  button) in `_includes/my-body.html`, following the exact pattern of the
  existing sound toggle: toggle `body.a11y-mode`, persist `localStorage('a11y')`,
  re-apply on `hy-push-state-after`.
- Early class-apply in `_includes/my-head.html` to avoid a flash-of-saturated-
  content on page load.

**No skin-registry in this workstream.** Four effective a11y states:
`light`, `dark`, `light+a11y`, `dark+a11y`. Hydejack's toggle is untouched.
Photos are unaffected — token neutralization only targets CSS custom properties,
not `<img>` elements. No `filter: grayscale(1)` on `<html>` (breaks `position:fixed`).

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

### WS-E — Skin registry + Anorex override skin

A small **in-repo** skin system for this site only: a registry, the two built-in
skins, and one runtime-loaded CSS-override skin (Anorex).

> **Scope note — this is NOT the Stellar stylesheet inject/eject work.** Earlier
> drafts of this section borrowed framing from `obrien-k/stellar*` (the
> `StylesheetInjector`, the `kuro`/`proton` standalone sheets, CDN/package
> delivery). That is a separate spec that lives in those repos and should be
> documented there — none of its CDN/packaging machinery applies to this Jekyll
> site. The only thing in common is the bare idea "swap a stylesheet at runtime".
> Don't import that scope here.

**"Inject" / "eject" here mean, concretely:**
- *Inject* — the switcher adds a single `<link id="hj-ext-skin">` that loads an
  override skin's compiled CSS at runtime. Built-in skins need no link (they're
  in the main Hydejack bundle).
- *Eject* — remove the feature to return to stock Hydejack: delete the
  skin-switcher block from `my-body.html` + the early-restore from `my-head.html`
  (and the override files under `assets/css/skins/`). No other template coupling.

**Architecture:**

- `_data/skins.yml` — registry: `id`, `label`, `short`, `hue` (signature color
  for the cycle dot/glyph), `desc`, `css` (null for built-ins, relative path for
  override skins), `dark`.
- `assets/css/skins/<name>.scss` — self-contained custom-property override
  targeting Hydejack's token layer (`--accent-rgb`, `--panel-bg`, etc.) + minimal
  structural selectors. **Authored in SCSS** (front-matter `assets/css/skins/<name>.scss`
  → Jekyll compiles to the sibling `.css` the registry injects). SCSS buys mixins
  to DRY the light/dark/a11y/OS-dark variants; the *output* is a standalone CSS
  file. (Was pure CSS; switched to SCSS once Anorex grew enough variants to DRY.)
- `_includes/my-head.html` — `<link id="hj-ext-skin" rel="stylesheet" href="">` +
  inline early-restore script (reads `localStorage('skin')`, sets `href` before
  first paint to prevent flash of wrong skin).
- `_includes/my-body.html` — skin switcher JS, inline in Hydejack's body-inject
  hook (see "Not yet modular" below). Reads `window.__skins` (Liquid-
  injected from `_data/skins.yml`), injects the **THEME** cycle button into the
  `.nav-btn-bar` (glyph tinted with the active skin's `hue`, a cycle-position dot
  row beneath, "THEME" caption), swaps the `<link>` href, persists
  `localStorage('skin')`. SPA-safe via `hy-push-state-after` re-inject. The
  **A11Y** toggle (`body.a11y-mode`) sits beside it with its own caption; the
  caption is kept in flow so THEME/A11Y align, with the dot row in flow beneath
  THEME (A11Y carries an empty dot-row spacer so the two captions stay aligned).

**Skin identity is decoupled from brightness (`body.skin-<id>`).** Originally the
two built-ins *were* the brightness state: dark-mode === VaporWave, light === FA.
That conflated "Frutiger-Aqua in dark mode" with "the VaporWave skin". Now the
switcher writes an explicit `body.skin-vaporwave|skin-frutiger-aqua|skin-anorex`
class (+ `localStorage('skin')`), orthogonal to Hydejack's own dark-mode toggle:
- **VaporWave** owns the magenta look on `body.skin-vaporwave` (forced dark).
- **Frutiger-Aqua** has its OWN dark mode (`@mixin fa-dark` — aqua accents on a
  dark night-sky canvas, dimmed FA drawer photo), triggered by
  `body.dark-mode:not(.skin-vaporwave):not(.skin-anorex)` + the OS-dark mirror.
- **Anorex** respects the brightness toggle for its light/dark wood variants.
`currentSkinId()` reads the class/storage, not `body.dark-mode`, so flipping
brightness no longer changes which skin you're on.

**Add a skin:** drop a new `.scss` file in `assets/css/skins/`, add one entry to
`_data/skins.yml`. No JS changes needed.

**Not yet modular (known gap).** The switcher + a11y toggle currently live as
inline `<script>` blocks in `_includes/my-body.html` (the Hydejack body-inject
hook), and the early-restore in `_includes/my-head.html` — not a single
self-contained partial. "Modular" here would mean extracting the switcher into
its own `_includes/skin-switcher.html` that `my-body.html` just `{% include %}`s
(Jekyll has no client-side "plugin" concept — this is template includes, not a
plugin). Deferred, not done; see Outstanding work below.

**Current skins:**

| id | Label | hue | Source |
|---|---|---|---|
| `vaporwave` | VaporWave | `#e100ff` | built-in SCSS (`frutiger-aqua.scss`, `body.skin-vaporwave`, magenta, forced dark) |
| `frutiger-aqua` | Frutiger Aqua | `#0099cc` | built-in SCSS default — aqua; light + its OWN aqua dark (`@mixin fa-dark`); `fa-sidebar-bg.jpg` drawer photo |
| `anorex` | Anorex | `#a56a22` | `assets/css/skins/anorex.scss` → compiled css — ported from Gazelle/WhatCD; light + dark wood |

**Anorex palette (Gazelle source → CSS token mapping):**
- Light: body text `#3E290A`, link `#573811` (darkened from `#6B481E` to clear
  WCAG AA — 6.7:1 — on the parchment reading surface), hover `#A56A22`, panel
  `#DCB881`, border `#65430F`.
- Backgrounds (helper mixins `ax-desk` / `ax-pane` / `ax-sidebar` / `ax-card` /
  `ax-wood-band`): the wood "desk" (`woodbg.png`) tiles the AX body under a
  **radial vignette** (lit toward the top-centre) so the grain reads with depth,
  not flat banding. The reading pane (`main.content`) floats a `0.68` parchment
  wash over the same grain (grain stays visible; body 6.1:1 / links 4.7:1 ✓ AA
  even over the darkest streaks). Blog cards float a translucent tan over the grain
  so it shows through.
- Post titles (`.post-title` — list cards on home/archive **and** the single-post
  page header): `woodhead.png` backs each title as a carved-wood **nameplate**
  (`ax-wood-band`, `inline-block` so it hugs the title text; `cover`-sized, rounded
  to the chip radius, inset bevel). Dark text clears AA on the light wood; dark
  mode flips to light text over a darkening overlay wash (a `filter` would dim the
  title text). This is the only place `woodhead.png` is used.
- Sidebar: the `.sidebar-bg` backdrop is just a soft "lamplight" gradient
  (`ax-sidebar`) over the warm base colour, with the `::after` scrim a gentle
  top/bottom edge vignette — no woodhead here. Each nav `li` carries a persistent
  carved-wood tab gradient, brighter on hover/current. Sidebar links are gold
  (`#dcb881`) in both brightness modes (the drawer is dark-backed, so its text
  always reads light).
- Dark = **night wood** (not flat black): the same grain darkened by a deep radial
  vignette on the desk + a stained-board wash on the pane; mahogany panels,
  golden-tan accents (`#C1965C`).
- Rounding lifted to `--panel-radius: 0.6rem` / `--chip-radius: 0.45rem` to match
  the built-in skins (was 0.2 / 0.15, read square next to FA).

**A11y mode across skins (WS-B + Anorex parity):**
- a11y is now **foreground-only** — it does NOT flatten backgrounds. Anorex (and
  FA) keep their full look (wood / sky, light and dark); a11y just swaps text and
  accents to higher-contrast neutrals. Anorex still needs its **own** blocks
  (it hardcodes with `!important`): `#433a2f` light (8.8:1), `#d8d2c4` dark
  (11.9:1). FA a11y accents `#706555` (5.7:1) / Steel `#888B8D` (4.75:1) clear AA.
  This makes a11y and non-a11y read identically, per skin.
- "a11y engaged" cue is a **filled pill** on the `Aa`/A11Y toggle (low-alpha fill
  in the theme's a11y accent) — no `main.content` border/outline (an earlier 2px
  frame read as a heavy box and was dropped).
- The sidebar/drawer is dark-backed in every skin + mode, so a11y forces ALL
  sidebar text light even in light page modes (the dark warm-grey accent is
  illegible on the drawer otherwise).

**Outstanding work (not done — don't read the detail above as "shipped"):**
- Extract the switcher into `_includes/skin-switcher.html` (modularity gap above).
- **WS-C — Taxonomy** (`jekyll-archives`, retire hand-rolled tag pages) — not started.
- **WS-D — Leadership Philosophy rustic/coffee-stain pass** — not started.
- A lot of recent effort went into WS-E polish (skins / a11y / sidebar); WS-C and
  WS-D are the next real line items.

(The earlier "publish as npm/gem/pip for CDN delivery" note was deleted — that
was imported Stellar scope, see the WS-E scope note; not a goal for this site.)

---

## 4. External / cross-repo dependencies

- **`ghost-2-jekyll`** (tentatively `archive-2-md`) — external Ghost→Jekyll importer.
  Owns the upstream normalization of the 2018 wuu.bi vocabulary (WS-C).
- **`~/git/resume`** — LaTeX resume pipeline; only viable home for real `coffeestains`
  output (WS-D, option b).
