

## Local build

Install R packages `googlesheets4` and `readr`, Typst 0.15.1, and the TeX Gyre
Pagella font family. Then run from this directory:

```sh
Rscript scripts/build.R
typst compile --root . typst/main.typ _site/cv.pdf
```

The generated page, CSVs, and PDF are in the ignored `_site/` directory.
