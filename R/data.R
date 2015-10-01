#' ID table from Ted Turocy's Chadwick Bureau
#' 
#' A data frame contains player ID mappings
#' 
#' @format A data frame with one row for each player and 9 columns:
#' \describe{
#'    \item{key_person}{Ted's ID for that person}
#'    \item{key_mlbam}{the person's MLBAM id}
#'    \item{key_retro}{the person's Retrosheet id}
#'    \item{key_bbref}{the person's Lahman id}
#'    \item{key_bbpro}{the person's Baseball Prospectus id}
#'    \item{key_fangraphs}{the person's FanGraphs id}
#'    \item{name_last}{the person's last name}
#'    \item{name_first}{the person's first name}
#'    \item{name_given}{the person's given name}
#' }
#' 
#' @source \url{http://chadwick-bureau.com/the-register/}
#' 
"idTT"

#' ID table from Baseball-Reference.com
#' 
#' A data frame contains player ID mappings
#' 
#' @format A data frame with one row for each player and 9 columns:
#' \describe{
#'    \item{bats}{}
#'    \item{bbrefID}{}
#'    \item{retroID}{the person's Retrosheet id}
#' }
#' 
#' @source \url{http://www.baseballprospectus.com/sortable/playerids/playerid_list.csv}
#' @seealso \code{\link[Lahman]{Master}}
#' 
"idBP"

#' fWAR values downloaded from FanGraphs.
#' 
#' A dataset containing fWAR values
#' 
#' @format A data frame with one row for each player-season and 11 columns:
#' \describe{
#'    \item{playerid}{the FanGraphs id of the player}
#'    \item{yearId}{the season}
#'    \item{Name}{the player's name}
#'    \item{fWAR}{the player's fWAR in that season}
#'    \item{fRAA_bat}{the Runs Above Average earned while batting}
#'    \item{fRAA_br}{the Runs Above Average earned while running the bases}
#'    \item{fRAA_field}{the Runs Above Average earned while fielding}
#'    \item{fWAR_pitch}{the Runs Above Average earned while pitching}
#'    \item{fRAR}{the Runs Above Replacement}
#'    \item{fRAA}{the Runs Above Average}
#'    \item{fRepl}{the replacement level, in runs}
#' }
#' 
#' @source \url{http://fangraphs.com/}
#' 
"fWAR"

#' rWAR values downloaded from Baseball-Reference.com
#' 
#' A dataset containing rWAR values
#' 
#' @format A data frame with one row for each player-season and 15 columns:
#' \describe{
#'    \item{playerId}{the Lahman id of the player}
#'    \item{yearId}{the season}
#'    \item{stintId}{the stint}
#'    \item{PA}{the number of plate appearances}
#'    \item{runs_position}{?}
#'    \item{rRAA_bat}{the Runs Above Average earned while batting and running the bases}
#'    \item{rRAA_field}{the Runs Above Average earned while fielding}
#'    \item{BFP}{the number of batters faced}
#'    \item{rRAA_pitch}{the Runs Above Average earned while pitching}
#'    \item{TPA}{the sum of PA and BFP}
#'    \item{rRAR}{the Runs Above Replacement}
#'    \item{rRAA}{the Runs Above Average}
#'    \item{rRepl}{the replacement level, in runs}
#'    \item{rWAR}{the WAR according to Baseball-Reference}
#'    \item{teamId}{the team's ID}
#' }
#' 
#' @source \url{http://baseball-reference.com/}
#' 
"rWAR"

#' Play-by-play information downloaded from MLBAM GameDay.
#' 
#' A dataset containing play-by-play data from MLBAM GameDay and processed by 
#' \code{openWAR}.
#' 
#' @format A data frame with 184,739 rows and 62 columns:
#' \describe{
#'    \item{pitcherId}{the MLBAM id of the pitcher}
#'    \item{batterId}{the MLBAM id of the batter}
#' }
#' 
#' @source \url{http://gd2.mlb.com/}
#' 
"MLBAM2012"

#' @rdname MLBAM2012
"MLBAM2013"

#' @rdname MLBAM2012
"MLBAM2014"

#' @rdname MLBAM2012
"MLBAM2015"


#' Play-by-play information downloaded from MLBAM GameDay and processed by openWAR models.
#' 
#' A dataset containing play-by-play data from MLBAM GameDay and processed by 
#' \code{openWAR}.
#' 
#' @format A data frame with 184,739 rows and 37 columns:
#' \describe{
#'    \item{pitcherId}{the MLBAM id of the pitcher}
#'    \item{batterId}{the MLBAM id of the batter}
#' }
#' 
#' @source \url{http://gd2.mlb.com/}
#' 
"openWARPlays2012"

#' @rdname openWARPlays2012
"openWARPlays2013"

#' @rdname openWARPlays2012
"openWARPlays2014"

#' @rdname openWARPlays2012
"openWARPlays2015"
