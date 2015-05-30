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
#'    \item{fRAA_pitch}{the Runs Above Average earned while pitching}
#'    \item{fRAR}{the Runs Above Replacement}
#'    \item{fRAA}{the Runs Above Average}
#'    \item{fRepl}{the replacement level, in runs}
#' }
#' 
#' @source \url{http://fangraphs.com/}
#' 
"fWAR"

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
"MLBAM2013"
