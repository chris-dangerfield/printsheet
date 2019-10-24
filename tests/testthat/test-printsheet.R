library(openxlsx)
library(tidyverse)

# Create a workbook
workbook <- createWorkbook()

# Add sheets
addWorksheet(workbook, "Index", gridLines = FALSE)
addWorksheet(workbook, "Fair")
addWorksheet(workbook, "Good")
addWorksheet(workbook, "Very Good")
addWorksheet(workbook, "Premium")
addWorksheet(workbook, "Ideal")

# Add data
writeData(workbook, 2, diamonds %>% filter(cut == "Fair"))
writeData(workbook, 3, diamonds %>% filter(cut == "Good"))
writeData(workbook, 4, diamonds %>% filter(cut == "Very Good"))
writeData(workbook, 5, diamonds %>% filter(cut == "Premium"))
writeData(workbook, 6, diamonds %>% filter(cut == "Ideal"))

# Make padding cols and rows
setRowHeights(workbook, 1, 1, 15)
setRowHeights(workbook, 1, 2, 25) # have to alter as heading is font size 20
setRowHeights(workbook, 1, 3, 15)
setRowHeights(workbook, 1, 6, 15)
setColWidths(workbook, 1, 1, 1)

# Add an index
writeData(workbook, 1, c("Diamonds"), 2,2)
writeData(workbook, 1, c("A dataset containing the prices and other attributes of almost 54,000 diamonds."), 2,4)
writeData(workbook, 1, c("A bit more about the dataset could go here"), 2,5)

# Add hyperlinks to index
writeFormula(workbook, 1, makeHyperlinkString(sheet = "Fair", row = 1, col = 1, text = "Fair"), 2,7)
writeFormula(workbook, 1, makeHyperlinkString(sheet = "Good", row = 1, col = 1, text = "Good"), 2,8)
writeFormula(workbook, 1, makeHyperlinkString(sheet = "Very Good", row = 1, col = 1, text = "Very Good"), 2,9)
writeFormula(workbook, 1, makeHyperlinkString(sheet = "Premium", row = 1, col = 1, text = "Premium"), 2,10)
writeFormula(workbook, 1, makeHyperlinkString(sheet = "Ideal", row = 1, col = 1, text = "Ideal"), 2,11)

# Make heading styles
heading <- createStyle(
  fontSize = 20,
  textDecoration = "bold"
)

# Apply heading styles
addStyle(workbook, 1, heading, 2,2)

saveWorkbook(workbook, "test.xlsx", overwrite = TRUE)





