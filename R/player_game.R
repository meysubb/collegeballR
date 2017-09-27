#' Get Player's Gamy by Game Stats
#'
#' Returns a dataframe of stats for all players by game
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
#' player_game(697,2016,"MBB")
#'
#' player_game(697,2015,"Womens Soccer")
#'

.player_game <- function(team_id,year,sport){
  team_raw <- .raw_weekly_team(team_id,year,sport)
  players <- team_raw %>%  filter(!(toupper(Player) %in% c("TEAM","TOTALS")))
}
