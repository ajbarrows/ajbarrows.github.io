# Portfolio

This repository contains three things:

- `ajbarrows.github.io/` — Astro portfolio website
- `cv_resume/` — LaTeX CV, resume, and NIH biosketch
- `publications.yaml` — single source of truth for all publications

---

## CV Content

Three YAML files at the repo root are the single source of truth for all CV content. Neither derived files (`bibliography.bib`, `education_rows.tex`, `experience_rows.tex`) nor the website should be edited by hand.

| File | Contents | Drives |
|---|---|---|
| `publications.yaml` | Papers, talks, abstracts | website `/work` · `bibliography.bib` · `ajb_cv.tex` pub sections |
| `education.yaml` | Degrees | website `/work` · `cv_resume/cv/education_rows.tex` |
| `experience.yaml` | Positions | website `/work` · `cv_resume/cv/experience_rows.tex` |

### pubman Setup

Install [pubman](https://github.com/ajbarrows/pubman) as a uv tool:

```bash
uv tool install git+https://github.com/ajbarrows/pubman
```

### Adding a publication

**From a DOI** (fetches metadata from CrossRef):
```bash
pubman --doi 10.1162/JOCN.a.2487
```

**From a BibTeX file:**
```bash
pubman --bib path/to/entry.bib
```

**Overriding the category:**
```bash
pubman --doi 10.xxxx/... --category invited-talk
```

| Category | CV section |
|---|---|
| `peer-reviewed` | Publications |
| `invited-talk` | Invited Talks |
| `selected-talk` | Selected Talks |
| `conference` | Abstracts |

Running any of the above automatically:
- adds an entry to `publications.yaml`
- regenerates `bibliography.bib`, `education_rows.tex`, `experience_rows.tex`
- inserts a `\pubentry` line into `ajb_cv.tex`
- rebuilds `ajb_cv.pdf` and copies it to `ajbarrows.github.io/public/assets/`

The website picks up the new entry on the next build (push to `main` triggers GitHub Actions).

### After adding a paper

For papers that should display a figure, place the image at:
```
figures/{key}.jpg
```

Both the website and CV pull from this directory via symlinks (`cv_resume/cv/pubfigures` and `ajbarrows.github.io/public/assets/images/figures` both point here).
Then set `featured: true` and `image: /assets/images/figures/{key}.jpg` in `publications.yaml`.

### Editing YAML directly

Edit any YAML file by hand, then regenerate all derived files:

```bash
pubman --regenerate
```

Note: removing a publication also requires manually removing its `\pubentry` (and `\pubgraphic` if peer-reviewed) from `ajb_cv.tex`.

### Key fields

| Field | Purpose |
|---|---|
| `key` | BibTeX citekey; also the expected figure filename |
| `category` | Controls which CV section the entry appears in |
| `featured` | `true` to show on the website papers page (default for peer-reviewed) |
| `image` | Website figure path (e.g. `/assets/images/figures/BaWe26.jpg`) |

---

## Website

```bash
cd ajbarrows.github.io
npm run dev      # dev server at localhost:4321
npm run build    # build to dist/
```

Content lives in `ajbarrows.github.io/src/config/`:
- `content.ts` — home, about, projects, music pages
- `events.ts` — music event schedule

The papers page reads `publications.yaml` directly at build time — no intermediate file needed.
Pushing to `main` triggers a GitHub Actions deploy to GitHub Pages.

---

## CV

`bibliography.bib` and `ajb_cv.tex` are managed by pubman — do not edit them by hand.
The PDF is rebuilt automatically whenever `pubman` adds or regenerates entries.

To recompile manually (e.g. after editing `ajb_cv.tex` directly):
```bash
cd cv_resume/cv && pdflatex ajb_cv.tex && bibtex ajb_cv && pdflatex ajb_cv.tex && pdflatex ajb_cv.tex
```
