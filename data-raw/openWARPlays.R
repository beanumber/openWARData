library(openWAR)
library(openWARData)

# It's rather large
print(object.size(MLBAM2012), units = "Mb")

# Use the data from 2012 to compute WAR
# This may take a while...
madeWAR <- makeWAR(MLBAM2012)
# Less than half the size of the raw data
print(object.size(madeWAR), units = "Mb")
# extract just the data frame
openWARPlays2012 <- madeWAR$openWAR
save(openWARPlays2012, file="data/openWARPlays2012.rda", compress = "xz")


openWARPlays2013 <- makeWAR(MLBAM2013)$openWAR
save(openWARPlays2013, file="data/openWARPlays2013.rda", compress = "xz")

openWARPlays2014 <- makeWAR(MLBAM2014)$openWAR
save(openWARPlays2014, file="data/openWARPlays2014.rda", compress = "xz")

openWARPlays2015 <- makeWAR(MLBAM2015)$openWAR
save(openWARPlays2015, file="data/openWARPlays2015.rda", compress = "xz")
