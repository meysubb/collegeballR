#' Extract Player Stats for a team, year and sport.
#'
#' Option to select data per season or per game
#' @param team_id Team ID (form team_mapping)
#' @param sport Tradiational Sport Name
#' @param year Select year, (example: 2015-2016 season is 2016)
#' @param by Stats over season, or stats per game
#' @keywords Player Stats
#' @export
#' @examples player_stats(697,2016,"MBB",by="SEASON")
#'
#' @examples player_stats(697,2016,"WSO",by="game")
#'
#'


player_stats <- function(team_id,year,sport,by="season"){
  if(tolower(by)=="game"){
    ret_dat <- .player_game(team_id,year,sport)
  }else if(tolower(by) == "season"){
    ret_dat <- .player_season_stats(team_id,year,sport)
  }else{
    stop("Pick Season or Game parameter for Players.")
  }
  return(ret_dat)
}
