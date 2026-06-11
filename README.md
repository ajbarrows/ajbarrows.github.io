# Portfolio

This repository contains three things:

- `ajbarrows.github.io/` — Astro portfolio website
- `cv_resume/` — LaTeX CV, resume, and NIH biosketch
- `publications.yaml` — single source of truth for all publications

---

## Publications

`publications.yaml` drives both the website and the CV. Neither derived file (`bibliography.bib`, the website's papers page) should be edited by hand.

### Setup

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
- regenerates `cv_resume/cv/bibliography.bib`
- inserts a `\pubentry` line into `cv_resume/cv/ajb_cv.tex`
- rebuilds `cv_resume/cv/ajb_cv.pdf`

The website picks up the new entry on the next build (push to `main` triggers GitHub Actions).

### After adding

For papers that should display a figure, place the image at both:
```
ajbarrows.github.io/public/assets/images/figures/{key}.jpg   ← website
cv_resume/cv/pubfigures/{key}.jpg                            ← CV
```

Then set `featured: true` and `image: /assets/images/figures/{key}.jpg` in `publications.yaml`.

### Editing the YAML directly

Edit `publications.yaml` by hand to fix a title, update an image path, etc. Then regenerate all derived files (BibTeX, CV PDF):

```bash
pubman --regenerate
```

Note: removing an entry also requires manually removing its `\pubentry` (and `\pubgraphic` if peer-reviewed) from `ajb_cv.tex`.

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
