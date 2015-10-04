library(dplyr)

bp.ids <- read.csv("http://www.baseballprospectus.com/sortable/playerids/playerid_list.csv")
names(bp.ids) <- c("nameLast", "nameFirst", "bpId", "davenportId", "mlbamId", "retroId")

# Merge with Lahman::Master
# ids <- merge(x = Lahman::Master, y = bp.ids, by.x = "retroID", by.y = "retroId", all = TRUE)

idBP <- as.tbl(bp.ids) %>%
  filter(!is.na(mlbamId))
 
save(idBP, file = "data/idBP.rda", compress = "xz")
