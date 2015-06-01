library(openWARData)

# BB-Ref updates their figures daily!
rWAR <- getrWAR()
save(rWAR, file = "data/rWAR.rda")
