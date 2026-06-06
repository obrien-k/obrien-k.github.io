# AGENTS.md

This file provides guidance to Codex (Codex.ai/code) when working with code in this repository.

## Site Overview

Personal blog/portfolio for Kyle OBrien (prefers **Kai**) at kyleobrien.me. Built with Jekyll 4.3 and the **free** Hydejack theme (gem-based: `jekyll-theme-hydejack ~> 9.1`, resolves to v9.2.1 — not PRO). Hosted on GitHub Pages with a custom domain via CNAME.

## Build Commands

```bash
bundle install              # Install dependencies (first time / after Gemfile changes)
bundle exec jekyll serve    # Local dev server at http://localhost:4000
bundle exec jekyll build    # Production build (output to _site/)
```

Search is disabled in development; set `JEKYLL_ENV=production` to enable it.

KaTeX math rendering requires a JavaScript runtime (Node.js) via the `duktape` / `kramdown-math-katex` gems.

## Architecture

**Theme**: Hydejack (free) is installed as a gem — layouts, includes, and assets live in the gem, not in this repo. Note: the free `home` layout is just `{{ content }}` (no post list/pagination); the paginated post list is the `blog` layout. The front page (`index.html`) uses `layout: home`; the paginated article list lives at `/archive/` (`layout: archive`, a local override). Only override files are local:

- `_includes/my-head.html` — empty (available for `<head>` injections)
- `_includes/my-body.html` — Cloudflare email protection script that re-runs on Hydejack's SPA page transitions (`hy-push-state-after` event)
- `_sass/my-inline.scss` — inline CSS overrides (currently empty/commented)
- `_sass/my-style.scss` — custom styles: content font-size bump (1.1rem), tighter heading letter-spacing, post-title weight

**Content structure**:
- `_posts/` — blog posts (date-prefixed markdown, `layout: post`)
- `_drafts/` — unpublished drafts
- `_featured_categories/` — category pages (currently just `code.md`)
- `tags/` — manually created tag index pages (each in `tags/<tag-name>/index.md`)
- `about.md` — about page (`layout: about`)
- `constellations.md` — external links page (`layout: plain`)

**Collections** defined in `_config.yml`: `featured_categories`, `featured_tags`, `projects`.

**Author data** lives in `_data/authors.yml` (key: `author1`). Social links, bio, and profile picture are configured there.

## Post Front Matter

Posts use this pattern:
```yaml
---
layout: post
title: "Title"
date: YYYY-MM-DD 00:00:00 +0000
description: "Short description for SEO/previews"
tags:
  - tag-name
categories:
  - category-name
image:
  path: /assets/img/blog/posts/slug/cover.png
---
```

Permalinks are `/:title/` (configured globally). When adding new tags, create a corresponding `tags/<tag-name>/index.md` page.

## Key Configuration

- Dark mode: dynamic (OS preference) + icon toggle
- `no_break_layout: true` — code blocks/tables stay within content width
- `use_lsi: true` — latent semantic indexing for related posts (requires `classifier-reborn` gem)
- `compress_html` enabled in production, disabled in development
- `_site/` is in `.gitignore` but may appear in the working tree as a build artifact
- `docs/` is reserved for project documentation (excluded from Jekyll build via `_config.yml`)

## CI/CD

- **Deploy**: pushes to `main` trigger `.github/workflows/jekyll.yml` (build + deploy to GitHub Pages)
- **CI**: PRs to `main` trigger `.github/workflows/ci.yml` (build + html-proofer, external links skipped)
- **Dependabot**: weekly updates for GitHub Actions and Bundler

## Maintaining This File

Update AGENTS.md when build commands, architecture, or conventions change. Keep it focused on non-obvious context that requires reading multiple files to understand. See README.md for full maintenance guidelines.
