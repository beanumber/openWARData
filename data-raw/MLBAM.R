library(openWAR)

# Get the data for 2012
MLBAM2012 = getData(start = "2013-03-28", end = "2013-10-03")
save(MLBAM2012, file = "data/MLBAM2012.rda", compress = "xz")

MLBAM2013 = getData(start = "2013-03-31", end = "2013-09-30")
save(MLBAM2013, file = "data/MLBAM2013.rda", compress = "xz")

MLBAM2014 = getData(start = "2014-03-22", end = "2013-09-28")
save(MLBAM2014, file = "data/MLBAM2014.rda", compress = "xz")

MLBAM2015 = getData(start = "2015-03-22", end = Sys.Date() - 1)
save(MLBAM2015, file = "data/MLBAM2015.rda", compress = "xz")
