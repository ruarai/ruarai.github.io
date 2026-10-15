
// The site build generates these CSVs before compiling the CV.
#let raw-data = csv("../_site/cv-data/paper_data_formatted.csv")

#let format-row(row) = {
  let authors  = row.at(1) + "."
  let title    = row.at(2) + "."
  let journal  = row.at(3) + "."
  let doi      = row.at(4)
  let href     = row.at(5)
  let is-first = row.at(13)
  let year     = row.at(8)
  

  let year-cell = if is-first == "TRUE" {
    year
  } else {
    none
  }

  let formatted-authors = [
    #show "Tobin RJ": strong
    #authors
  ]
  
  let formatted-title = [
    #show "Plasmodium knowlesi": emph
    #title
  ]
  
  let citation-cell = table.cell(breakable: false)[
    #formatted-authors #formatted-title _ #journal _ #link(href)[#doi]
  ]
  
  (year-cell, citation-cell)
}

#let papers-rows = raw-data.slice(1).map(format-row).flatten()


#let raw-data-talks = csv("../_site/cv-data/talk_data_formatted.csv")

//   value               ix
//   <chr>            <dbl>
// date                 0
// authors              1
// title                2
// type                 3
// venue                4
// location             5
// year                 6
// is_first_in_year     7
// date_nice     8

#let format-talk-row(row) = {
  let authors  = row.at(1) + "."
  let title    = row.at(2)
  let type     = row.at(3) + "."
  let venue      = row.at(4) + "."
  let location = row.at(5)
  let year     = row.at(6)
  let is_first = row.at(8)
  let date_nice = row.at(7)
  

  let year-cell = if is_first == "TRUE" {
    year
  } else {
    none
  }

  let formatted-authors = [
    #show "Tobin RJ": strong
    #authors
  ]
  
  let formatted-title = [
    #show "Plasmodium knowlesi": emph
    #title
  ]
  
  let citation-cell = table.cell(breakable: false)[
    #formatted-authors #formatted-title at the _ #venue _ #type (#date_nice, #location)
  ]
  
  (year-cell, citation-cell)
}

#let talks-rows = raw-data-talks.slice(1).map(format-talk-row).flatten()
