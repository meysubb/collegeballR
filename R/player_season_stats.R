#' Get Player's Season Stats
#'
#' Returns a dataframe of season stats for all players on the team
#' in a specific sport and year.
#' @param team_id Team ID from team_mapping
#' @param sport Tradiational Sport Name or Sport Code
#' @param year Actual Year
#' Note for seasons Year1-Year2, Year2 is what you want to use in the functions.
#' For example, the 2015-2016 season is denoted for 2016.
#' @importFrom magrittr "%>%"
#' @importFrom xml2 "read_html"
#' @importFrom rvest "html_table"
#' @keywords internal
#' @export
#' @examples
#' player_season_stats(697,2016,"MBB")
#'
#' player_season_stats(697,2015,"Womens Soccer")
#'

.player_season_stats <- function(team_id,year,sport){
  team_url <- .team_url_stats(team_id,year,sport)
  stats_list <- read_html(team_url) %>% html_table()
  stats_df <- stats_list[[length(stats_list)]]
  player_df <- stats_df[1:(nrow(stats_df)-3),]
  player_df$year <- year
  return(player_df)
}
