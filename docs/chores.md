# Chores

Pending cross-repo work too context-heavy to sweep inline. Pick these up with a focused session per item.

---

## stellar-ui: swap nav logo text → kuro-logo.png

**Repos:** `obrien-k/stellar-ui`
**Files:**
- `src/components/pages/private/layout/PrivateHeader.tsx` line 58 — `Stellar` text in gradient Link
- `src/components/pages/public/PublicLayout.tsx` line 22 — same pattern

**What to do:**
1. Copy `kuro-logo.png` (canonical) into stellar-ui's asset directory (check `public/` or `src/assets/`)
2. Replace gradient text Link with `<img src={logo} alt="Stellar" className="h-8 w-auto" />` (or equivalent) in both components
3. Update tests in `__tests__/layout/PrivateLayout.test.tsx`, `PrivateHeader.test.tsx`, `PublicLanding.test.tsx`, `Install.test.tsx` that assert on the text `STELLAR`/`Stellar`

**Source logo:** `~/git/obrien-k.github.io/_drafts/stellar/kuro-logo.png`
(also at `~/git/mern/client/public/static/styles/kuro/images/logo.png`)

---

## stellar-ui / mern: stylesheet theme work (abandoned, retain where possible)

**Repos:** `obrien-k/mern`, `obrien-k/stellar-ui`
**Context:** Three full Gazelle-era CSS themes exist in `mern/client/public/static/styles/`: `kuro` (dark), `anorex`, `layer_cake`. Work to integrate them was started in the `permissions` branch (`7feec05`, `e58d36d`) and tabled — Gazelle CSS (8pt Tahoma, pixel layouts) doesn't map cleanly to React/Tailwind.

**What to retain:**
- Color tokens: extract kuro/anorex/layer_cake palettes into CSS variables or Tailwind theme extensions
- Category icon sprites: base64-embedded in theme CSS, could be extracted to individual SVGs
- Logo assets per theme: kuro → `kuro-logo.png`, anorex → `anorex-logo.png`, layer_cake → `layer-cake-logo.png` / `layer-cake-logo-dk.png`

**Theme → logo mapping** (all in `_drafts/stellar/`):
| Theme | Logo file |
| --- | --- |
| kuro | kuro-logo.png |
| anorex | anorex-logo.png |
| layer_cake (light) | layer-cake-logo.png |
| layer_cake (dark) | layer-cake-logo-dk.png |

---

## mr-janitor rename → mr-robot

**Repo:** `~/git/skills/skills/in-progress/mr-janitor/`
Future rename to `mr-robot`. When it happens: update `name:` frontmatter, `description:` trigger line, and any `[[mr-janitor]]` memory links.
