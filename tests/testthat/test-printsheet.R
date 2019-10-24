library(openxlsx)
library(tidyverse)
library(viridis)

# Create a workbook
workbook <- createWorkbook()

# Get colours to use
sheet_cols <- substr(viridis(5), 1,7)

# Add sheets
addWorksheet(workbook, "Index", gridLines = FALSE)
addWorksheet(workbook, "Fair", tabColour = sheet_cols[1])
addWorksheet(workbook, "Good", tabColour = sheet_cols[2])
addWorksheet(workbook, "Very Good", tabColour = sheet_cols[3])
addWorksheet(workbook, "Premium", tabColour = sheet_cols[4])
addWorksheet(workbook, "Ideal", tabColour = sheet_cols[5])

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
setColWidths(workbook, 1, 2, 0.25)
setColWidths(workbook, 1, 3, 0.5)

# Add an index
writeData(workbook, 1, c("Diamonds"), 2,2)
writeData(workbook, 1, c("A dataset containing the prices and other attributes of almost 54,000 diamonds."), 2,4)
writeData(workbook, 1, c("A bit more about the dataset could go here"), 2,5)

# Add hyperlinks to index
writeFormula(workbook, 1, makeHyperlinkString(sheet = "Fair", row = 1, col = 1, text = "Fair"), 4,7)
writeFormula(workbook, 1, makeHyperlinkString(sheet = "Good", row = 1, col = 1, text = "Good"), 4,8)
writeFormula(workbook, 1, makeHyperlinkString(sheet = "Very Good", row = 1, col = 1, text = "Very Good"), 4,9)
writeFormula(workbook, 1, makeHyperlinkString(sheet = "Premium", row = 1, col = 1, text = "Premium"), 4,10)
writeFormula(workbook, 1, makeHyperlinkString(sheet = "Ideal", row = 1, col = 1, text = "Ideal"), 4,11)

# Make heading styles
heading <- createStyle(
  fontSize = 20,
  textDecoration = "bold"
)
sheet_col_style_1 <- createStyle(
  fgFill = sheet_cols[1]
)
sheet_col_style_2 <- createStyle(
  fgFill = sheet_cols[2]
)
sheet_col_style_3 <- createStyle(
  fgFill = sheet_cols[3]
)
sheet_col_style_4 <- createStyle(
  fgFill = sheet_cols[4]
)
sheet_col_style_5 <- createStyle(
  fgFill = sheet_cols[5]
)

# Apply heading styles
addStyle(workbook, 1, heading, 2,2)

# Add sheet col styles
addStyle(workbook, 1, sheet_col_style_1 , 7,2)
addStyle(workbook, 1, sheet_col_style_2 , 8,2)
addStyle(workbook, 1, sheet_col_style_3 , 9,2)
addStyle(workbook, 1, sheet_col_style_4 , 10,2)
addStyle(workbook, 1, sheet_col_style_5 , 11,2)

saveWorkbook(workbook, "test.xlsx", overwrite = TRUE)





