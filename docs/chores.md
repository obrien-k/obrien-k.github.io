# Chores

Pending cross-repo work too context-heavy to sweep inline. Pick these up with a focused session per item.

---

## stellar-ui: swap nav logo text → kuro-logo.png

**Branch:** `feat/stylesheets` (PR #34 `orphic-inc/stellar-ui`)

- `src/components/pages/private/layout/PrivateHeader.tsx:58` — replace `Stellar` gradient text Link
- `src/components/pages/public/PublicLayout.tsx:22` — same
- Replace with `<img src={logo} alt="Stellar" className="h-8 w-auto" />`
- Update affected tests: `PrivateLayout.test.tsx`, `PrivateHeader.test.tsx`, `PublicLanding.test.tsx`, `Install.test.tsx`

Logo assets already in `_drafts/stellar/` — copy to `src/stylesheets/<theme>/images/` as needed.

---

## skin system: evaluate publishing as a package

**Recurring** — revisit quarterly or when a downstream project needs the skin registry.

The WS-E skin system (`_data/skins.yml` + `assets/css/skins/*.css` + `my-head.html`
early-restore + `my-body.html` THEMES widget) is designed to be ejectable. The
natural next step is CDN delivery so forks can pull skin updates without a rebuild.

Options to evaluate:
- **npm package** — publish `assets/css/skins/*.css` as `@obrien-k/hj-skins`. Update
  `css:` entries in `skins.yml` to the jsDelivr/unpkg CDN URL. No rebuild required
  by consumers.
- **Ruby gem** — wrap as a Hydejack companion gem; gem users add it to `Gemfile`.
  Lower friction for Jekyll-native consumers.
- **pip package** — only if a Python-based static site (e.g. MkDocs) needs the skins.

Until a concrete downstream need arrives, leave as-is. When evaluating: check if the
CSS custom-property layer is thin enough to be skin-engine-agnostic (it mostly is).

---

## mr-janitor rename → mr-robot

**Repo:** `~/git/skills/skills/in-progress/mr-janitor/`
Future rename to `mr-robot`. When it happens: update `name:` frontmatter, `description:` trigger line, and any `[[mr-janitor]]` memory links.
