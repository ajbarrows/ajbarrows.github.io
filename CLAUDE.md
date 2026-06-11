# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Layout

This repository contains three distinct areas:

- `ajbarrows.github.io/` — The main portfolio website (Astro static site)
- `cv_resume/` — LaTeX source for CV, resume, and NIH biosketch
- `job_applications/` — Archive of application materials organized by company

All web development work happens inside `ajbarrows.github.io/`.

## Development Commands

All commands run from `ajbarrows.github.io/`:

```bash
npm run dev      # Start dev server at localhost:4321 (hot reload)
npm run build    # Build static site to dist/
npm run preview  # Preview production build locally
```

There are no tests or lint commands configured.

## Architecture

**Framework**: Astro 5.x with static output (`output: 'static'`), deployed to GitHub Pages via GitHub Actions on push to `main`. Styling is Tailwind CSS 3.4 with the Typography plugin; dark mode uses the `class` strategy toggled via localStorage.

### Content is Data-Driven via Config Files

Most page content is not in the `.astro` files themselves — it lives in `src/config/`:

- `content.ts` — Site metadata, home/about page copy, experience timeline, projects list, social links
- `papers.ts` — Research publications with DOIs, figure images, and Semantic Scholar IDs for live citation counts
- `events.ts` — Music event schedule

To add or update content (bio, publications, experience, projects), edit these config files rather than touching pages directly.

### Page Routing

Astro uses file-based routing from `src/pages/`. Blog posts are Markdown files in `src/content/posts/` with YAML frontmatter; `src/utils/getPosts.ts` handles retrieval and sorting. The dynamic route `src/pages/posts/[slug].astro` renders individual posts.

### Key Behaviors

- `papers.astro` fetches live citation counts from the Semantic Scholar API at build time
- The Navigation component handles the dark/light theme toggle and persists preference to localStorage
- Static assets go in `public/`; optimized images go in `src/assets/images/`
