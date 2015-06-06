library(openWARData)


test_that("crosscheck works", {
  expect_is(crosscheck(MLBAM2012), "numeric")
})
