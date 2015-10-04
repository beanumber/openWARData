library(openWARData)


test_that("crosscheck works", {
  expect_is(crosscheck(MLBAM2012), "numeric")
})

test_that("data are tbls", {
  expect_is(MLBAM2012, "GameDayPlays")
  expect_is(idTT, "tbl_df")
  expect_is(idBP, "tbl_df")
  expect_is(rWAR, "tbl_df")
  expect_is(fWAR, "tbl_df")
})
