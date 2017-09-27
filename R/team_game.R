#' Get Team Season Stats
#'
#' Returns a dataframe of the overall team's stats by game
#' for the sport and year chosen.
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
#' team_game(697,2016,"MBB")
#'
#' team_game(697,2015,"Womens Soccer")


.team_game <- function(team_id,year,sport){
  team_raw <- .raw_weekly_team(team_id,year,sport)
  team_raw_2 <- team_raw %>%  filter(toupper(Player) %in% c("TEAM","TOTALS"))
  team_clean <- team_raw_2 %>% filter(!(toupper(Player) == "TEAM"))
  return(team_clean)
}
