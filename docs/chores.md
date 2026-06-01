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

## mr-janitor rename → mr-robot

**Repo:** `~/git/skills/skills/in-progress/mr-janitor/`
Future rename to `mr-robot`. When it happens: update `name:` frontmatter, `description:` trigger line, and any `[[mr-janitor]]` memory links.
