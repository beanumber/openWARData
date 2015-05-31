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
openWARPlays.2012 <- madeWAR$openWAR
save(openWARPlays.2012, file="data/openWARPlays.2012.rda")


openWARPlays.2013 <- makeWAR(MLBAM2013)$openWAR
save(openWARPlays.2013, file="data/openWARPlays.2013.rda")

openWARPlays.2014 <- makeWAR(MLBAM2014)$openWAR
save(openWARPlays.2014, file="data/openWARPlays.2014.rda")
