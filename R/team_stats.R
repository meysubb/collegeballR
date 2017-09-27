#' Extract Team Stats for a year and sport.
#'
#' Option to select data per season or per game
#' @param team_id Team ID (form team_mapping)
#' @param sport Tradiational Sport Name
#' @param year Select year, (example: 2015-2016 season is 2016)
#' @param by Stats over season, or stats per game
#' @keywords Team Stats
#' @export
#' @examples team_stats(697,2016,"MBB",by="SEASON")
#'
#' @examples team_stats(697,2016,"WSO",by="game")
#'


team_stats <- function(team_id,year,sport,by="season"){
  if(tolower(by)=="game"){
    ret_dat <- .team_game(team_id,year,sport)
  }else if(tolower(by) == "season"){
    ret_dat <- .team_season_stats(team_id,year,sport)
  }else{
    stop("Pick Season or Game parameter for Teams.")
  }
  return(ret_dat)
}
