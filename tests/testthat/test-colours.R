context("Colour creation for sheets")

library(printsheet)

test_that("The number of colours expands", {
  expect_equal(length(create_sheet_colours(c("#eeeeee", "#999999"), 5)), 5)
  expect_equal(length(create_sheet_colours(c("#eeeeee", "#333333", "#999999"), 5)), 5)
  expect_equal(length(create_sheet_colours(c("#999999"), 5)), 5)
})

test_that("The number of colours contracts", {
  expect_equal(length(create_sheet_colours(c("#eeeeee", "#999999","#eeeeee", "#333333", "#999999"), 2)), 2)
  expect_equal(length(create_sheet_colours(c("#eeeeee", "#333333", "#999999", "#999999"), 2)), 2)
  expect_equal(length(create_sheet_colours(c("#999999", "#999999"), 3)), 3)
})

test_that("Non colours give errors", {
  expect_error(create_sheet_colours(c("#eeeeee", "blah","#eeeeee"), 6)) 
  expect_error(create_sheet_colours(c("#eeeeee", 6,"#eeeeee"), 6)) 
})

test_that("Character numbers colours give errors", {
  expect_error(create_sheet_colours(c("#eeeeee","#eeeeee"), "6")) 
  expect_error(create_sheet_colours(c("#eeeeee", "#eeeeee", "#eeeeee"), "6 blah")) 
})

test_that("Matplotlib colour palettes give colours", {
  
})