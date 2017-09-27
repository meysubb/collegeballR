#' Create Team URL's
#'
#' Create's team urls for different names.
#' @param team_id Team ID from team_mapping
#' @param sport Tradiational Sport Name or Sport Code
#' @param year Actual Year (example: 2016 or 2015)
#' @keywords internal
#' @export
#' @examples
#' team_url_stats(697,2015,"Men's Basketball")
#'
#' team_url_stats(697,2015,"Womens Soccer")


.team_url_stats <- function(team_id,year,sport){
  if(is.numeric(team_id)){
    sport_code <- sport_code(sport)
    year_id <- .year_ref(year,sport)
    url <- paste0("http://stats.ncaa.org/team/",team_id,"/stats/",year_id,sep="")
  }else{
    stop("Please provide the correct team id, use team_mapping for reference")
  }
  return(url)
}
