#' @title getrWAR
#' 
#' @description Retrieves fWAR from FanGraphs.com by year
#' 
#' @details Retrieves yearly fWAR figures from FanGraphs.com and stores it as a data.frame
#' 
#' @return a data.frame consisting of fWAR
#' 
#' @import dplyr
#' @importFrom scrapeR scrape
#' @importFrom XML xpathSApply
#' @importFrom XML readHTMLTable
#' 
#' @export
#' @examples
#' 
#' # Get data from 2015 
#' ds = getfWAR(2015)
#' 
#' # Show the top 20 leaders in fWAR in 2015
#' head(ds[order(ds$WAR, decreasing=TRUE),], 20)
#' 

getfWAR = function(yyyy) {
  message("...All fWAR data courtesy of FanGraphs.com")
  # Get the batters fWAR first
  url = paste("http://www.fangraphs.com/leaders.aspx?pos=all&stats=bat&lg=all&qual=0&type=6&season=",
              yyyy,"&month=0&season1=",yyyy,
              "&ind=0&team=0&rost=0&age=0&filter=&players=0&page=1_10000",
              sep="")
  # The scrape function from the scrapeR package makes this so much easier
  doc = scrapeR::scrape(url)
  # Find the FanGraphs leaderboard table which holds the data we want
  data = XML::xpathSApply(doc[[1]], '//table[@id="LeaderBoard1_dg1_ctl00"]')
  # This stores the batters' fWAR table. We have specify the classes of each
  # column because R wants to turn them all into factors
  bat = XML::readHTMLTable(data[[1]],
                          colClasses = c("integer","character","factor","numeric",
                            "numeric","numeric","numeric","numeric","numeric","numeric",
                            "numeric","numeric","numeric","character"))
  # We need to change the Base Running column to Base.Running
  colnames(bat)[5] <- "Base.Running"
  
  # Get the pitchers fWAR
  url = paste("http://www.fangraphs.com/leaders.aspx?pos=all&stats=pit&lg=all&qual=0&type=6&season=",
              yyyy,"&month=0&season1=",yyyy,
              "&ind=0&team=0&rost=0&age=0&filter=&players=0&page=1_10000",
              sep="")
  doc = scrapeR::scrape(url)
  data = XML::xpathSApply(doc[[1]], '//table[@id="LeaderBoard1_dg1_ctl00"]')
  pitch = XML::readHTMLTable(data[[1]],
                            colClasses = c("integer", "character", "factor", 
                              "numeric", "numeric", "numeric", "numeric", "numeric",
                               "numeric", "character"))
  
  # merge the bat and pitch fWAR tables
  all = merge(x=bat, y=pitch, by = c("Name"), all=TRUE)
  # append a yearId column to data
  all$yearId = yyyy
  
  # Download the crunchtimebaseball player id map because it is more current
  id.map = read.csv("http://crunchtimebaseball.com/master.csv")
  id = data.frame(Name = id.map$fg_name,  playerId = id.map$fg_id)
  # Merge all and id to add the FanGraphs player IDs to the data
  all = merge(all, id, by="Name")
  
  out = all %>%
    mutate(fRAA_bat = ifelse(is.na(Batting), 0, Batting) + ifelse(is.na(Positional), 0, Positional)) %>%
    mutate(fRAA_br = ifelse(is.na(Base.Running), 0, Base.Running)) %>%
    mutate(fRAA_field = ifelse(is.na(Fielding), 0, Fielding)) %>%
    mutate(fWAR_pitch = ifelse(is.na(WAR.y), 0, WAR.y)) %>%
    mutate(fRepl = ifelse(is.na(Replacement), 0, -Replacement)) %>%
    mutate(fRAR = ifelse(is.na(RAR.x), 0, RAR.x) + ifelse(is.na(RAR.y), 0, RAR.y)) %>%
    mutate(fRAA = fRAR + fRepl) %>%
    mutate(fWAR = ifelse(is.na(WAR.x), 0, WAR.x) + fWAR_pitch) %>%
    select(playerId, yearId, Name, fWAR, fRAA_bat, fRAA_br, fRAA_field,
           fWAR_pitch, fRAR, fRAA, fRepl)
  return(out)
}