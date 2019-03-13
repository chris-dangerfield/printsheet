# printsheet
Easily create beautiful spreadsheets with R. Printsheet aims to tansform your data into a human readable form, described, styled and linked. We are currently working up a beta release, if you would like to help, let me know at chris.dangerfield@gmail.com.

## The vision
Ever finished a piece of analysis and wanted to give the results to your stakeholders, but the first thing they have to do is open it and resize the columns, add a filter, or copy some data into another workbook to make it useful to them? Printsheet aims to make some assumptions in this process to automate the creation of human readable spreadsheets.

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

A description is added to the index sheet with a basic R markdown file:
```R
printsheet(m, formula = . ~ Name, description = "desc.Rmd")
```

And the title of the file can be changed to something meaningful:
```R
printsheet(m, formula = . ~ Name, description = "desc.Rmd", title = "Motor Trend Car Road Tests")
```

If a two column definitions data frame is provided, a link will be created to a "definitions" sheet from the colunn headings:
```R
printsheet(m, formula = . ~ Name, definitions = mtcars_defs)
```
Styles can be added through a JSON style sheet:
```R
printsheet(m, formula = . ~ Name, styles = "path-to-local-style-sheet.json")
```

Logos can be added as either a link to a file or a weblink (the logo will be resized automatically):
```R
printsheet(m, formula = . ~ Name, logo = "https://web-link-to-logo.png")
```

Fine tuning settings can also be created through JSON style sheet, so that corporate colour schemes, and style can be used from a single location:
```R
printsheet(m, formula = . ~ Name, settings = "path-to-local-settings-sheet.json")
```

A simple zip command creates the files in a single zip directory:
```R
printsheet(m, formula = Name ~ ., zip = TRUE)
```

Colours are interpolated from a character vector and used to colour tabs in the workbook and provide some colour on the title sheet:
```R
printsheet(m, formula = Name ~ ., colours = c("#eeeeee", "#999999"))
```

The [viridis colour palette](https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html) will be used by default with others in that series such as "inferno" being able to be specified by name in the colours parameter:
```R
printsheet(m, formula = Name ~ ., colours = "inferno")
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

