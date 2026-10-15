# Run from the repository root: Rscript scripts/build.R
# Optional arguments: local input directory (papers.csv and talks.csv), output directory.
args <- commandArgs(trailingOnly = TRUE)
output_dir <- if (length(args) >= 2L) args[[2L]] else "_site"

sheet_url <- "https://docs.google.com/spreadsheets/d/1qeDFA-oPjc4XDH-6aK_1XqzSbHz09uEeOml-l71f1q8/edit"

if (length(args) >= 1L) {
  papers <- readr::read_csv(file.path(args[[1L]], "papers.csv"), show_col_types = FALSE)
  talks <- readr::read_csv(file.path(args[[1L]], "talks.csv"), show_col_types = FALSE)
} else {
  googlesheets4::gs4_deauth()
  papers <- googlesheets4::read_sheet(sheet_url)
  talks <- googlesheets4::read_sheet(sheet_url, sheet = "Presentations")
}

validate <- function(data, columns, required, label) {
  missing <- setdiff(columns, names(data))
  if (length(missing)) {
    stop(label, " is missing columns: ", paste(missing, collapse = ", "))
  }
  if (!nrow(data)) stop(label, " has no rows")
  for (column in required) {
    if (any(is.na(data[[column]]) | !nzchar(trimws(as.character(data[[column]]))))) {
      stop(label, " has empty values in ", column)
    }
  }
}

validate(papers,
         c("date_published", "authors", "title", "journal", "DOI", "href_html", "href_github", "href_pdf"),
         c("date_published", "authors", "title", "journal", "href_html"), "Publications")
validate(talks, c("date", "authors", "title", "type", "venue", "location"),
         c("date", "authors", "title"), "Presentations")

parse_dates <- function(x, label) {
  dates <- as.Date(x)
  if (anyNA(dates)) stop("Invalid dates in ", label)
  dates
}

escape_html <- function(x) {
  x <- gsub("&", "&amp;", x, fixed = TRUE)
  x <- gsub("<", "&lt;", x, fixed = TRUE)
  x <- gsub(">", "&gt;", x, fixed = TRUE)
  x <- gsub('"', "&quot;", x, fixed = TRUE)
  gsub("'", "&#39;", x, fixed = TRUE)
}

first_in_year <- function(years) c(TRUE, diff(years) != 0)

papers$date_published <- parse_dates(papers$date_published, "Publications")
papers <- papers[order(papers$date_published, decreasing = TRUE), ]
papers$year <- as.integer(format(papers$date_published, "%Y"))
papers$authors_html <- gsub("Tobin RJ", "<b>Tobin RJ</b>", escape_html(papers$authors), fixed = TRUE)
papers$authors_typst <- gsub("Tobin RJ", "*Tobin RJ*", papers$authors, fixed = TRUE)
papers$title_html <- gsub("Plasmodium knowlesi", "<i>Plasmodium knowlesi</i>",
                          escape_html(papers$title), fixed = TRUE)
papers$title_typst <- gsub("Plasmodium knowlesi", "_Plasmodium knowlesi_", papers$title, fixed = TRUE)
papers$is_first_in_year <- first_in_year(papers$year)
papers$final_row <- seq_len(nrow(papers)) == nrow(papers)

link <- function(url, label) {
  if (is.na(url) || !nzchar(trimws(url))) return("")
  if (!grepl("^https?://|^/papers/", url)) stop("Unsupported link: ", url)
  if (startsWith(url, "/papers/")) {
    if (grepl("..", url, fixed = TRUE) || !file.exists(sub("^/", "", url))) {
      stop("Missing or invalid local PDF: ", url)
    }
  }
  sprintf('[<a href="%s" target="_blank">%s</a>]', escape_html(url), label)
}

publication_html <- vapply(seq_len(nrow(papers)), function(i) {
  p <- papers[i, ]
  sprintf('<li>
    <div class="link_holder">
      %s
      %s
    </div>
    <hr class="paper_divider">
    %s. %s. <i>%s</i>. (%s)
    %s
</li>', link(p$href_pdf, "PDF"), link(p$href_html, "HTML"),
          p$authors_html, p$title_html, escape_html(p$journal), p$year,
          if (p$final_row) "" else '<hr class="dottedhr">')
}, character(1))

talks$date <- parse_dates(talks$date, "Presentations")
talks <- talks[order(talks$date, decreasing = TRUE), ]
talks$year <- as.integer(format(talks$date, "%Y"))
day <- as.integer(format(talks$date, "%d"))
suffix <- ifelse(day %% 100L %in% 11:13, "th",
                 ifelse(day %% 10L == 1L, "st",
                        ifelse(day %% 10L == 2L, "nd", ifelse(day %% 10L == 3L, "rd", "th"))))
talks$date_nice <- paste(month.name[as.integer(format(talks$date, "%m"))],
                         paste0(day, suffix), talks$year)
talks$is_first_in_year <- first_in_year(talks$year)

template <- readLines("templates/index.html", encoding = "UTF-8", warn = FALSE)
marker <- which(trimws(template) == "<!-- PUBLICATIONS -->")
if (length(marker) != 1L) stop("Template must contain exactly one PUBLICATIONS marker")
html <- append(template[-marker], publication_html, after = marker - 1L)

# Nothing is written until both sheets and the page have been validated.
dir.create(file.path(output_dir, "cv-data"), recursive = TRUE, showWarnings = FALSE)
for (asset in c("style.css", "images", "papers")) {
  if (!file.copy(asset, output_dir, recursive = TRUE, overwrite = TRUE)) {
    stop("Could not copy asset: ", asset)
  }
}
writeLines(enc2utf8(html), file.path(output_dir, "index.html"), useBytes = TRUE)
readr::write_csv(papers, file.path(output_dir, "cv-data", "paper_data_formatted.csv"))
readr::write_csv(talks, file.path(output_dir, "cv-data", "talk_data_formatted.csv"))
message("Built ", nrow(papers), " publications and ", nrow(talks), " presentations in ", output_dir)
