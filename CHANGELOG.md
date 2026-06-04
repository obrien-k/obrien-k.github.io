---
layout: plain
sitemap: false
---

# CHANGELOG
{:.no_toc}

* this list will be replaced by the toc
{:toc .large-only}

## v0.0.6
Jun 03 2026
{:.heading.post-date}

### Frutiger Aqua
- Two-skin theme foundation — one set of rules driven by CSS custom properties serves both skins: the dark "16-bit" vaporwave identity and a new light "32-bit" Vista-Aero skin, flipping only the values per mode
- Frutiger Aero glass surfaces in light mode — aqua-tinted translucent panels with a wet specular top edge, soft rim, depth, and backdrop blur; degrade cleanly to the flat 16-bit panel in dark
- Vista-aurora light sidebar — a glossy teal→blue gradient (legible white text) as the saturated counterpart to the page background; dark mode keeps its static 海 sidebar image
- Light-mode page background retargeted to the Vista "Wow" palette — teal→dark-blue, rendered as a repeatable Aero pattern on the content pane, kept pale enough for legible dark text
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
