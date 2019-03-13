# printsheet
Easily create beautiful spreadsheets with R. Printsheet aims to tansform your data into a human readable form, described, styled and linked. We are currently working up a beta release, if you would like to help, let me know at chris.dangerfield@gmail.com.

## The vision
With one function, the dataset is exported to xlsx, with columns resized, and saved with an appropriate name in the working directory:
```R
printsheet(mtcars)
```
With a formula it exports files and sheets:
```R
library(dplyr)
m <- add_rownames(mtcars, "Name")
printsheet(m, formula = Name ~ .) # Exports a file per car name, with all data on one sheet
printsheet(m, formula = . ~ Name) # Exports one file with one sheet per car name, and an index sheet
```

## Proposed features
* One function to transform data into a spreadsheet for ease of use
* The ability to specify a formula and create many sheets with many tabs from one dataset (eg files ~ sheets)
* A mini Rmd to xlsx parser, supporting three heading styles, body style, and linking style from Rmarkdown, and also support for glue syntax
* Logo insertion (hopefully including resizing), and could include the ability to download a file from the web if supplied with a web path
* Colour generator for tabs that incorporates matplotlib colours, with viridis being default
* A file naming function for formula based files
* Styles JSON, with the ability to override default styles
* A themes JSON with the ability to override defaults in a range of options
* An index creator function to create links to tabs from a title page
* Create a data dictionary function to allow linking from a column heading to the definition on a definitions tab, could also include where the definition is used on the defintions tab

