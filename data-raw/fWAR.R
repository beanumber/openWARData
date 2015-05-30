##
## Download fWAR as CSV files
##
## Need to manually to to their website and "Save to Excel..."
## This assumes you have those files stored locally already

library(openWARData)
library(dplyr)

bat = read.csv(system.file("extdata", "FanGraphs_2005-2013_batting.csv", package = "openWARData"))
pitch = read.csv(system.file("extdata", "FanGraphs_2005-2013_pitching.csv", package = "openWARData"))
out = merge(x=bat, y=pitch, by = c("playerid", "Season"), all=TRUE)

fWAR <- out %>%
  mutate(Name = ifelse(is.na(Name.x), as.character(Name.y), as.character(Name.x))) %>%
  mutate(yearId = Season) %>%
  mutate(fRAA_bat = ifelse(is.na(Batting), 0, Batting) + ifelse(is.na(Positional), 0, Positional)) %>%
  mutate(fRAA_br = ifelse(is.na(Base.Running), 0, Base.Running)) %>%
  mutate(fRAA_field = ifelse(is.na(Fielding), 0, Fielding)) %>%
  mutate(fWAR_pitch = ifelse(is.na(WAR.y), 0, WAR.y)) %>%
  mutate(fRepl = ifelse(is.na(Replacement), 0, -Replacement)) %>%
  mutate(fRAR = ifelse(is.na(RAR.x), 0, RAR.x) + ifelse(is.na(RAR.y), 0, RAR.y)) %>%
  mutate(fRAA = fRAR + fRepl) %>%
  mutate(fWAR = ifelse(is.na(WAR.x), 0, WAR.x) + fWAR_pitch) %>%
  select(playerid, yearId, Name, fWAR, fRAA_bat, fRAA_br, fRAA_field
               , fWAR_pitch, fRAR, fRAA, fRepl)

save(fWAR, file="data/fWAR.rda")