##
## Download the Baseball Register from Ted Turocy's site
## http://chadwick-bureau.com/the-register/

library(dplyr)

url <- "http://www.chadwick-bureau.com/data/register/register-20150405.zip"
download.file(url, destfile = "inst/extdata/register.zip")

# Unzip it
unzip("inst/extdata/register.zip", exdir = "inst/extdata/")

# read the file
register <- read.csv("inst/extdata/register-20150405/register.csv")
# register = read.csv(system.file("extdata", "register.csv", package = "openWARData"))

# remove the ZIP file
# unlink("inst/extdata/register.zip")
# unlink("inst/extdata/register-20150405")

idTT <- as.tbl(register) %>%
  filter(!is.na(key_mlbam)) %>%
  select(key_person, key_mlbam, key_retro, key_bbref, key_bbpro
           , key_fangraphs, name_last, name_first, name_given)

# Examine Mike Trout
# filter(idTT, name_last == "Trout")
# save it to the data folder
save(idTT, file="data/idTT.rda", compress = "xz")
