# kyleobrien.me

Personal blog and portfolio for Kyle OBrien (Kai). Built with [Jekyll](https://jekyllrb.com/) and the [Hydejack](https://hydejack.com/) theme.

Live at [kyleobrien.me](https://kyleobrien.me).

## Local Development

```bash
bundle install
bundle exec jekyll serve
```

Site will be available at `http://localhost:4000`.

**Requirements**: Ruby, Bundler (`gem install bundler`), and a JavaScript runtime (Node.js) for KaTeX math rendering.

## Deployment

Pushes to `main` trigger a GitHub Actions workflow (`.github/workflows/jekyll.yml`) that builds and deploys to GitHub Pages. PRs to `main` run a CI check (`.github/workflows/ci.yml`) that builds the site and runs html-proofer.

## Project Structure

```
_posts/          Blog posts (date-prefixed markdown)
_drafts/         Unpublished drafts
_featured_categories/  Category pages
tags/            Tag index pages
_data/           Author profile, social links, theme strings/variables
_includes/       Custom head/body includes (Hydejack override points)
_sass/           Custom SCSS overrides
assets/          Images, icons, CSS
docs/            Project documentation (reserved)
```

The Hydejack theme (free tier, `jekyll-theme-hydejack`) is gem-based. Layouts and most includes come from the gem; only override files live in this repo.
