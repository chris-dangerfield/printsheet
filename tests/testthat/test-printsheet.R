library(openxlsx)
library(tidyverse)

# Create a workbook
workbook <- createWorkbook()

# Add sheets
addWorksheet(workbook, "Index")
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

saveWorkbook(workbook, "~/Documents/R/test.xlsx")
