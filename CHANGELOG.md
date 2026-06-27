---
layout: plain
sitemap: false
---

# CHANGELOG
{:.no_toc}

* this list will be replaced by the toc
{:toc .large-only}

## v0.1.8
Jun 26 2026
{:.heading.post-date}

### Added
- **"The Android's Dream; A Love Letter to the Bomb"** (2020-06-14) — the WordPress
  developer-community and WhatCo.de scraps merged into one piece with the Uber
  Googlers as the spine: WordPress → Orphic Inc. → the Uber Googlers → BC4WP →
  WhatCo.de, threaded by the "does it fall apart?" question. Ships 6 Orphic / Uber
  Googlers screenshots.

### Changed
- **AI-ethics post.** Wired the 2022 Craiyon "six devils" render into the post. (#41)
- **Sidebar reorder.** Leadership Philosophy below Constellations; removed Vanity
  House and "Listen to this Album." (#41)
- **CI.** Bumped `actions/checkout` 6 → 7 (Node 24-era runner). (#39)

## v0.1.7
Jun 13 2026 — **tag held; not released**
{:.heading.post-date}

> ⚠️ **Known issue.** The WS-F dark-mode theme-switcher fixes below did **not** hold —
> the regression still reproduces, so the `v0.1.7` tag is held until it genuinely
> lands. Tracking: [#43](https://github.com/obrien-k/obrien-k.github.io/issues/43).

### Added
- **Category `/tags/` redirects + featured BigCommerce post.** (#36)

### Changed
- **Sidebar: projects above experience.** (#37)
- **Build: exclude dev/agent docs (CLAUDE/AGENTS/README) from the built site.**

### Fixed (attempted — see Known issue above)
- **Theme switcher dark-mode bugs (WS-F).** Three root causes patched:
  - `widgets.html` was reading `sk.color` to tint sidebar THEME chips; the field is
    `hue` in `_data/skins.yml` — all chips rendered white. Fixed.
  - `widgets.html`'s local `currentSkinId()` used an old `dark-mode === vaporwave`
    heuristic, predating the explicit `body.skin-<id>` class system (WS-F). Replaced
    with a `body.skin-*` class scan → localStorage → `default` flag fallback chain,
    matching `switcher.html`'s authoritative logic.
  - `switcher.html` restore block didn't reinstate `body.light-mode` for FA
    (`dark: false`) on reload. Hydejack uses `light-mode` to suppress
    `prefers-color-scheme: dark` auto-application; without it, FA would re-render
    dark on every page load for users whose OS is in dark mode. Fixed.
  - `a11y.html` bailed early on SPA navigation instead of re-acquiring the existing
    `#_a11y-toggle` reference — left `a11yBtn` null, silencing all `updateA11yBtn()`
    calls until hard reload. Fixed.

## v0.1.6
Jun 10 2026
{:.heading.post-date}

### Fixed
- **Anorex résumé coffee ring is light-mode only now.** It read badly on the
  night-wood desk, so it's hidden in Anorex dark (and OS-dark) — shown on the light
  wood only.

## v0.1.5
Jun 10 2026
{:.heading.post-date}

The real coffee-stain (WS-D method b) lands — on the résumé, in Anorex only — and
the first docx-imported post goes live.

### Themes
- **Anorex résumé coffee ring.** The actual LaTeX `coffeestains` render (compiled in
  `~/git/resume`, stain A — the broken mug-ring — exported to a transparent PNG)
  now sits over the top-right of the résumé pane **only under the Anorex skin** — a
  mug ring on the WhatCD wood desk. Authored in `anorex.scss` as `body .resume::after`
  (the AX sheet's injection is the skin gate; `.resume` is resume-only), `multiply`
  on the light wood, normal blend on night-wood, desaturated in a11y, hidden on
  narrow screens. (The pure-CSS ring on Leadership Philosophy is unchanged.)

### Added
- **"How to Build Your First BigCommerce App"** (2020-06-19) — published from a
  Word `.docx` via the `archive-2-md` converter's docx adapter. Conversion
  artifacts cleaned on import (inline-code underscores; the JSON payload re-fenced
  as a `json` block).

## v0.1.4
Jun 10 2026
{:.heading.post-date}

VaporWave is finally itself. The legacy sidebar THEME chips were wired to the old
dark-mode heuristic, so clicking **VaporWave** actually landed you on Frutiger-Aqua
dark. They now delegate to the real switcher, and VaporWave gets the synthwave
reading pane it never had.

### Fixed
- **The THEME chips select the *true* skin now.** `switcher.html` exposes
  `window.__skinSystem = { applySkin, currentSkinId }`; `widgets.html`'s sidebar
  chips drive those (with a legacy fallback) instead of their own dark-mode-only
  copy — so "VaporWave" sets `body.skin-vaporwave` (magenta, purple-wave
  `sidebar-bg.jpg` everywhere) rather than resolving to FA-dark. The active-chip
  highlight tracks the real skin too.

### Themes
- **VaporWave synthwave content pane.** A pure-CSS `--page-bg` on `body.skin-vaporwave`
  — magenta perspective verticals + faint cyan scanlines over a bottom-centre
  horizon radial fading into a near-black indigo field. Three layers, aligned to
  `_base`'s `main.content { background-size: auto, auto, cover }`; low-alpha so the
  light VaporWave body text and glass cards keep their contrast. No image asset.
- **VW-resume light-mode legibility** closed out on the clean base/overlay split.

(Block-comments-only preserved in the skin-system partials; production build green.
See `docs/architecture.md` WS-F + §4 for the converter roadmap closure.)

## v0.1.3
Jun 10 2026
{:.heading.post-date}

Skin-system modularization (WS-F) — the monolithic `frutiger-aqua.scss` is split
into a neutral base plus layered skin overlays, and the skin-system JavaScript
into focused includes. A pure refactor: the compiled CSS is **byte-identical** to
v0.1.2 (verified by diffing the build — 486 selectors, zero declaration changes).

### Changed
- **`_sass/frutiger-aqua.scss` → `_sass/skins/{_base,_frutiger-aqua,_vaporwave,_a11y}.scss`.** The shared, token-driven chrome (sidebar widgets, the one-per-viewport selector, the a11y framework, the structure of resume / constellations / blog cards, the `aero-surface` mixin) is now a skin-agnostic **base**; Frutiger Aqua, VaporWave, and the a11y neutralization are clean overlays that just set tokens. `_a11y` imports **last** so it still wins over VaporWave on the a11y combination (the two are equal-specificity, so cascade order is the tiebreak for `--panel-bg` / `--cp-*` / …). Verified behaviour-preserving via a Playwright sweep across 3 skins × light / dark / a11y.
- **Skin-system JS extracted into `_includes/skin-system/`** — `registry`, `widgets` (SFX / status / THEMES / sound / Konami), `switcher` (cycle button + skin-class restore), `a11y`, `archive-filters`, and the head `restore`, each its own partial included in the same order from `my-body` / `my-head`. The skin system is now an ejectable, vendorable set of partials.
- **Registry-driven default skin** — `default: true` in `_data/skins.yml` replaces a hardcoded fallback; it's the one-line switch for which skin shows when none is saved (pairs with the matching import in `my-style.scss`).

### Fixed
- **The skin cycle button and early skin-restore were silently broken in production.** Hydejack's `compress_html` collapses newlines inside scripts, so a `//` line-comment swallowed the rest of the IIFE — disabling the nav cycle button and the saved-skin restore-before-paint on the live (compressed) site. Dev builds (compress off) were fine, which hid it. All skin-system scripts now use `/* */` block comments. Pre-existing since WS-E; surfaced by the WS-F verification.

## v0.1.2
Jun 10 2026
{:.heading.post-date}

### Themes
- **Leadership Philosophy gets a rustic pass (WS-D).** The five pillars now sit on aged-paper cards — a warm wash, hand-cut (irregular) corners, and a soft inner double-rule — with a faint CSS coffee-ring stain (no image asset). It's token-driven off the shared `--cp-*` palette, so it adapts per skin (brown on Anorex, teal on Frutiger Aqua, magenta on VaporWave) and greys out in a11y/greyscale

## v0.1.1
Jun 10 2026
{:.heading.post-date}

Taxonomy consolidation (WS-C) — the 2018 vocabulary was a mess (9 hand-rolled tag
pages, corrupted multi-value `categories:` front matter). It's now a clean,
auto-generating system.

### Taxonomy
- **Four canonical categories** — `code · technology · AI · life`, one primary per post. The 17 posts' `categories:`/`tags:` front matter was rewritten clean (dropped the `wuubi` provenance marker, merged variants like `web-browser(s)` → `browsers`, removed terms that are now categories)
- **Tag pages auto-generate** via `jekyll-archives` (`/tags/:name/`, preserving the old URLs) — the 9 hand-rolled `tags/<name>/index.md` pages and the dead `featured_tags` collection are retired. Category landing pages use Hydejack's native `featured_categories` (`/code/ /technology/ /ai/ /life/`)
- **The `/archive/` gains category + tag + year filters** — category chips plus tag/year dropdowns, filtering the list client-side (the old year picker had no JS and never worked). `/tags/` is now a clean tag cloud linking to the archive pages

### Fixed
- Archive post-meta (dates, category/tag labels) no longer **overflows the reading pane onto the Anorex woodgrain** where it was illegible — scoped to the archive, so the wood is untouched on articles and other pages
- Post tag links resolve to their `/tags/:name/` archive pages again (retiring `featured_tags` had left them as dead plain text)

## v0.1.0
Jun 10 2026
{:.heading.post-date}

The three-skin system (VaporWave · Frutiger Aqua · Anorex) lands as a milestone —
this release reconciles the parallel theme work and fixes the rough edges left
behind: one theme selector per viewport, readable custom pages in every skin, and
VaporWave's signature magenta restored on reload.

### Themes
- **One theme selector per viewport** (they used to both show and collide). Desktop (≥ 64em, persistent sidebar) gets the **color chips** in the sidebar; mobile gets the compact **THEME** cycle button in the top bar. Each carries a color eye-check — the chips are tinted per theme, the cycle button shows a signature-tinted glyph plus an enlarged per-skin dot row
- **VaporWave coloring restored.** VaporWave is a dark-only skin, so it now forces dark-mode on every load / direct-nav — it was painting light on reload, washing the magenta out to an unreadable pink-on-white. The `<html>` canvas is pre-painted dark in `<head>` to soften the load flash
- **Custom pages now theme readably per skin** (Resume, Vanity House, Listen to this Album, Leadership Philosophy, Constellations). The shared `--cp-*` palette gets per-skin values that clear WCAG AA on each skin's pane: Frutiger Aqua deepens its aqua to teal (`#0099cc` → `#006986`, ~3.5:1 → ~5:1), Anorex uses warm wood browns on the parchment, VaporWave keeps its hand-picked magenta/purple on the dark canvas

### Content
- About page: added a **DiSC "Perfectionist" profile** figure below the Factoids, captioned with the shortened official definition (linked to the source)

## v0.0.10
Jun 10 2026
{:.heading.post-date}

### Themes
- **Frutiger Aqua and VaporWave are now separate skins.** Skin identity lives on a `body.skin-*` class instead of being inferred from dark-mode, so Frutiger Aqua has its own **aqua dark mode** (dark night-sky pane, dimmed FA drawer photo) rather than turning into VaporWave's magenta when you toggle brightness. VaporWave keeps its magenta + `sidebar-bg.jpg` look on its own
- Frutiger Aqua drawer uses the dedicated `fa-sidebar-bg.jpg` photo (faint aqua scrim for legible white text) in place of the hand-rolled gradient
- Anorex: rounded panels/chips to match the other skins (`0.6`/`0.45rem`); woodgrain in **all four states** (light/dark × a11y) — dark mode is now night-wood, not flat; radial-lit "desk" with a parchment wash on the reading pane (grain visible, text still AA); translucent-woodgrain blog cards; a carved-wood selector gradient on each nav item; and a radial lamplight highlight in the sidebar
- Anorex post titles now sit on a **`woodhead.png` carved-wood nameplate** (`.post-title` — the home/archive list cards and the single-post page header), `inline-block` so the band hugs the title text; dark mode darkens the wood with a wash and flips the title text light. The sidebar stays a clean lamplight gradient (woodhead is used only on post titles now)
- Sidebar title `KyleOBrien.me#Kai` → `KyleOBrien.me/Kai`
- Skin cycle button is now a labelled **THEME** control: signature-tinted glyph plus a cycle-position dot row (one dot per skin); the **A11Y** toggle is labelled to match, captions aligned

### Accessibility
- A11y mode now actually engages on Anorex (it previously no-op'd under the skin's hardcoded colors); it is **foreground-only** — backgrounds keep their full look so a11y and non-a11y read identically per skin, with only text/accents neutralized to high-contrast
- "A11y engaged" cue is a subtle filled pill on the **A11Y** toggle (no content-pane outline)
- The dark-backed sidebar/drawer keeps its text light in every mode — fixes illegible sidebar links (e.g. the status `doing:` link) in a11y light mode
- Audited and corrected contrast to WCAG AA: Anorex links `#6B481E`→`#573811` (was 4.36:1), plus verified the FA and Anorex a11y palettes

### Build
- Anorex skin migrated to SCSS (`anorex.scss`, front-matter compiled) so mixins DRY the light/dark/a11y/OS-dark variants; ships as the same ejectable `anorex.css`

## v0.0.9
Jun 04 2026
{:.heading.post-date}

### Housekeeping
- Editorial pass — tightened post and changelog references for accuracy

## v0.0.8
Jun 04 2026
{:.heading.post-date}

### Status
- Sidebar/drawer status widget: kaomoji mood label, `doing` now links out, refreshed the now-playing track

## v0.0.7
Jun 04 2026
{:.heading.post-date}

### Cards
- Front-page and blog-index cards now lead with the post's cover image — resolved automatically: the post's `image:` front matter, else the first inline image in the body, else the site `accent_image`, so every card has artwork with no per-post config and a cover-less post degrades cleanly instead of breaking the grid

### Content
- 黒春光琳海 — added a reference link in the #what-refuge section (Dunham, Ch. 3, pp. 65–113)

### Resume
- Imported earlier experience, backfilling the timeline before BigCommerce — OpenTable (Customer Support Representative, Denver CO, 2016–2017) and DISH (three roles across Alvin TX and Denver CO, 2012–2016; includes the PAW award and a sub-two-minute support-response metric)
- Added "Customer Success" to skills
- Kept both data sources in sync — the rendered page (`_data/resume.yml`) and the downloadable JSON (`assets/resume.json`); PDF and vCard regenerate later from the LaTeX source (`obrien-k/resume`)

## v0.0.6
Jun 04 2026
{:.heading.post-date}

### Frutiger Vista
- Two-skin theme foundation — one set of rules driven by CSS custom properties serves both skins: the dark "16-bit" vaporwave identity and a new light "32-bit" Vista-Aero skin, flipping only the values per mode
- Frutiger Aero glass surfaces in light mode — aqua-tinted translucent panels with a wet specular top edge, soft rim, depth, and backdrop blur; degrade cleanly to the flat 16-bit panel in dark
- Vista-aurora light sidebar — a saturated green → teal → blue sweep (resampled off the Vista login screen) with a bright `#bfeef5` "light shelf" seam at ~75%, carrying legible white text; a clean gradient with no overlaid texture. Dark mode keeps its static 海 sidebar image
- Light-mode page background — a pale whisper-green → ice → sky-blue sweep beneath repeating silk-light ribbons on the content pane, kept high-key for legible dark text
- Aurora-mapped buttons — the resume action bar and constellation link chips share one fixed, viewport-covering Vista aurora (`assets/img/vista-aurora.png`), so each button reveals the slice at its on-screen position; a dark scrim keeps white labels legible
- Status widget — dark translucent glass with solid white text at 7.79:1 contrast (WCAG AAA), legible on the saturated sidebar and colorblind-safe
- Cardified the blog index

## v0.0.5
Jun 02 2026
{:.heading.post-date}

### Content
- Clarified series navigation links in "Waking Software Engineering" and "A Million and One Ways to NOT Share You're Trans" posts — removed redundant part-1 self-reference, tightened link text for chronological flow
- Merged `stellar.md` COLOPHON and Gazelle assets into the `黒春光琳海` post
- Added `AGENTS.md` and supplementary images

### Fixed
- Resolved `html-proofer` CI pipeline failure by restoring a missing `irc-channels.jpg`
- Fixed Jekyll build failure by clearing out a rogue image directory and the `stellar.md` draft

### Infrastructure
- Reverted a broken Cloudflare proxy workflow to restore standard GitHub Pages deployment
- Removed an accidental Playwright inclusion

## v0.0.4
Mar 13 2026
{:.heading.post-date}

### Performance
- Removed scanline overlay — `position: fixed` full-viewport repeating gradient was the primary cause of SPA transition lag; also duplicated by Hydejack's `.animation-main` content clone during page transitions
- Removed CRT stutter activation effect from Konami code (Superstar mode retains shake, rainbow, and star particles)
- Removed `backdrop-filter: blur()` from post cards — expensive GPU compositing for a nearly-invisible effect (`rgba(255,255,255,0.06)` panel)
- Removed `box-shadow` hover transitions from post cards — border-color transition only

### Constellations
- Added All Around Electronics to Neighbors section
- Reverted card redesign back to simple link buttons — eliminated 4 Google Favicon API requests and 1 GitHub avatar CDN request per page load

### Bug Fixes
- Fix inline JS broken by `compress_html` in production

### Config
- Add SOURCE link to configuration

## v0.0.3
Mar 11 2026
{:.heading.post-date}

### Interactivity
- Sound toggle in sidebar footer — Web Audio API synthesized click/hover/page-transition sounds, no audio files, state persisted in localStorage
- Status widget in sidebar — mood, activity, and now-playing pulled from `_data/status.yml`
- Konami code Easter egg (`↑↑↓↓←→←→BA`) — triggers Superstar mode: content shake, 8 seconds of rainbow color cycling with star particles, ascending/descending arpeggio
- Superstar shake targets `.content` only (sidebar stays still); uses `left`/`top` animation to avoid creating a containing block
- Rainbow activation delayed 200ms so first CRT stutter pulse lands on a clean screen
- All features respect `prefers-reduced-motion`; Superstar mode falls back to a gentle color pulse

## v0.0.2
Mar 09 2026
{:.heading.post-date}

### Indieweb-ify
- Custom CSS theme: frutiger aero meets 16-bit — translucent glass panels, gradient link underlines, CRT scanline overlay, pixel-shadow image frames
- Vaporwave-inflected scrollbars and selection color
- Glassy sidebar overlay and card hover glow
- Terminal-style code blocks with magenta accent border
- Gradient horizontal rules and frosted blockquotes

### Accessibility
- Skip-to-content link via `_includes/my-head.html`
- `:focus-visible` outlines for keyboard navigation
- `prefers-reduced-motion` — disables all animations and removes scanline overlay
- `prefers-contrast: more` — solidifies translucent borders, adds traditional underlines

### Indieweb Furniture
- Constellations page restructured as links page with Neighbors, Frequencies, and Badges sections
- `.badge-wall` component for 88x31 pixel badge trading
- `.constellation-link` styled link chips
- Personalized 404, offline, and error messages in `_data/strings.yml`

### Comments
- Giscus integration via `_includes/my-comments.html` (GitHub Discussions-backed, no third-party service)
- Comment input above existing comments, lazy-loaded, respects OS color scheme
- Noscript fallback linking to GitHub Discussions

### Resume
- Custom `_layouts/resume.html` with monospace-terminal aesthetic, glassy skill chips, and print output

### Config
- Enabled explicit monospace font stack for code blocks

## v0.0.1
Mar 08 2026
{:.heading.post-date}

### Site Foundation
- Initial Hydejack PRO setup with gem-based theme (`jekyll-theme-hydejack ~> 9.1`)
- Custom domain configured at kyleobrien.me
- Dark mode enabled (dynamic OS preference + icon toggle)
- KaTeX math rendering via `kramdown-math-katex`
- LSI-powered related posts via `classifier-reborn`

### Content
- Migrated archived posts from Ghost
- Published posts: Dreaming in Code, Waking Software Engineering, AI Ethics, Time Management, Software Development Life Cycle, I'm Trans, 黒春光琳海
- About page and Constellations (external links) page
- Category page for Code; tag pages for 9 tags

### Infrastructure
- GitHub Actions deploy pipeline (`.github/workflows/jekyll.yml`)
- CI with html-proofer on PRs (`.github/workflows/ci.yml`)
- Dependabot for GitHub Actions and Bundler
- Cloudflare email protection integration via `_includes/my-body.html`

### Cleanup
- Removed Hydejack starter kit boilerplate (`docs/`, unused includes)
- Replaced starter kit README with project-specific documentation
