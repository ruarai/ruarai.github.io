# Personal site

GitHub Actions builds this static site from Google Sheets on pushes to `master`,
daily at 20:17 UTC, and manually via **Actions → Build and deploy site to Pages →
Run workflow**. The workflow deploys only `_site/` and does not commit generated
files. Push these changes to enable the updated build.

## Editing

- Edit `templates/index.html` for page content; keep its `<!-- PUBLICATIONS -->` marker.
- Edit `style.css`, `images/`, and `papers/` for static assets.
- Edit the [Google Sheet](https://docs.google.com/spreadsheets/d/1qeDFA-oPjc4XDH-6aK_1XqzSbHz09uEeOml-l71f1q8/edit)
  for publications (first tab) and presentations (`Presentations` tab).
  It must remain readable without signing in. Changes appear after the next build.
- Upload PDFs into `papers/` and use `/papers/filename.pdf` in `href_pdf`, or use
  an external HTTP(S) URL. Blank PDF links are omitted.


## Local build

From this directory, install dependencies once, then build:

```sh
Rscript scripts/build.R
```

