library(openxlsx)
library(tidyverse)

work_book <- openxlsx::createWorkbook() %>% 
  addWorksheet("New Sheet")

context("write_markdown")

lines <- c(
  "# A big heading",
  "Some text under this big heading",
  "",
  "## A second level heading",
  "Some text under this heading with [a link to Google](http://www.google.com).",
  "And, some bullet points",
  "* First, at the top level",
  "** Then, a level below this",
  "*** Then, a level below that",
  "**** And a fourth level"
)

wb <- createWorkbook()

test_that("Links have been detected, and converted to hyperlinks", {
 expect_equal(
   write_markdown(wb, 1, lines[5]),
   '="Some text under this heading with "&HYPERLINK("http://www.google.com", "a link to Google")&"."'
 ) 
})

test_that("Two hyperlinks in one line produces errors", {
  expect_error(
    write_markdown("[a link](http://www.example.com), and [another link](http://www.google.com)"),
    "One line of markdown cannot contain more than one link."
  )
})

test_that("Bullets are converted to ")

test_that("Heading sytles are applied")