# ajbarrows.github.io

Personal portfolio and academic website. Built with Astro, deployed to GitHub Pages on push to `main`.

## Development

```bash
npm run dev      # dev server at localhost:4321
npm run build    # build to dist/
npm run preview  # preview production build
```

## Content

Most page content lives in `src/config/` — edit these files rather than the `.astro` pages directly:

- `content.ts` — site metadata, home/about copy, experience timeline, projects, social links
- `events.ts` — music event schedule

**Publications** are driven by `../publications.yaml` at the portfolio root. See the [portfolio README](../README.md) for the workflow.

Blog posts are Markdown files in `src/content/posts/` with YAML frontmatter.

## Architecture

- **Framework**: Astro 5.x, static output
- **Styling**: Tailwind CSS 3.4 with Typography plugin; dark mode via `class` strategy
- **Routing**: file-based from `src/pages/`; blog posts use `src/pages/posts/[slug].astro`
- **Citations**: fetched live from Semantic Scholar API at build time via DOI
