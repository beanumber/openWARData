#' @title getrWAR
#' 
#' @description Retrieves rWAR from Baseball-Reference.com
#' 
#' @details Retrieves daily rWAR figures from Baseball-Reference.com and stores it as a data.frame
#' 
#' @return a data.frame consisting of rWAR
#' 
#' @import dplyr
#' @export
#' @examples
#' 
#' # Get data from yesterday
#' \dontrun{
#' rWAR = getrWAR()
#' }
#' data(rWAR)
#' hist(rWAR$rWAR)
#' 
#' # Leaders since 1954
#' library(dplyr)
#' modern = filter(rWAR, yearId >= 1954)
#' head(arrange(modern, desc(rWAR)), 20)
#' 
#' # Relationship between batting and fielding
#' plot(modern$rRAA_bat, modern$rRAA_field, cex=0.5)

getrWAR <- function() {
    bat <- "http://www.baseball-reference.com/data/war_daily_bat.txt"
    pitch <- "http://www.baseball-reference.com/data/war_daily_pitch.txt"
    rWAR.b <- read.csv(bat, na.strings = c("NULL", "NA", ""))
    rWAR.p <- read.csv(pitch, na.strings = c("NULL", "NA", ""))
    
    # Grab the number of batters faced for pitchers
    bf.lkup <- Lahman::Pitching[, c("playerID", "yearID", "teamID", "stint", "BFP")]
    rWAR.p <- merge(x = rWAR.p, y = bf.lkup, by.x = c("player_ID", "year_ID", "stint_ID"), by.y = c("playerID", "yearID", "stint"), 
        all.x = TRUE)
    
    bat.fields <- c("player_ID", "year_ID", "stint_ID", "team_ID", "PA", "runs_position", "runs_above_rep", "runs_above_avg", 
        "runs_above_avg_off", "runs_above_avg_def", "WAR")
    pitch.fields <- c("player_ID", "year_ID", "stint_ID", "team_ID", "BFP", "runs_above_rep", "runs_above_avg", "WAR")
    rWAR <- merge(x = rWAR.b[, bat.fields], y = rWAR.p[, pitch.fields], by = c("player_ID", "year_ID", "stint_ID"), all = TRUE)
    rWAR <- rename_(rWAR, rRAA_bat = ~runs_above_avg_off
                    , rRAA_field = ~runs_above_avg_def
                    , rRAA_pitch = ~runs_above_avg.y
                    , playerId = ~player_ID
                    , yearId = ~year_ID
                    , stintId = ~stint_ID)
    rWAR <- mutate_(rWAR, TPA = ~ifelse(is.na(PA), 0, PA) + ifelse(is.na(BFP), 0, BFP))
    rWAR <- mutate_(rWAR, rRAR = ~ifelse(is.na(runs_above_rep.x), 0, runs_above_rep.x) + ifelse(is.na(runs_above_rep.y), 0, runs_above_rep.y))
    rWAR <- mutate_(rWAR, rRAA = ~ifelse(is.na(runs_above_avg.x), 0, runs_above_avg.x) + ifelse(is.na(rRAA_pitch), 0, rRAA_pitch))
    rWAR <- mutate_(rWAR, rRepl = ~rRAA - rRAR)
    rWAR <- mutate_(rWAR, rWAR = ~ifelse(is.na(WAR.x), 0, WAR.x) + ifelse(is.na(WAR.y), 0, WAR.y))
    rWAR <- mutate_(rWAR, teamId = ~ifelse(is.na(team_ID.x), as.character(team_ID.y), as.character(team_ID.x)))
    out = rWAR[, setdiff(1:ncol(rWAR), grep("\\.(x|y)", names(rWAR)))]
    return(out)
} 
