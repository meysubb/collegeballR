#' Extract Raw Base schedule
#'
#' Extracts the date, team's played and the results
#' @param team_id Team ID (form team_mapping)
#' @param sprt Tradiational Sport Name
#' @param yr Select year, (example: 2015-2016 season is 2016)
#' @keywords internal
#' @export
#' @examples
#'

.extract_base_schedule <- function(team_id,year,sport){
  year_id <- .year_ref(year,sport)
  all_team_names <- team_mapping(year,sport)
  team_name <- all_team_names[which(all_team_names$team_id == team_id),2]
  url <- paste0("http://stats.ncaa.org/player/game_by_game?game_sport_year_ctl_id=",year_id,"&org_id=",team_id,"&stats_player_seq=-100")
  basic <- read_html(url) %>% html_nodes(".smtext") %>% html_text()
  basic <- gsub("[\r\n]", "", basic)
  basic <- trimws(basic)
  basic_df <- as.data.frame(t(matrix(basic,nrow=3)),stringsAsFactors = FALSE)
  colnames(basic_df) <- c("Date","Opponent","Score")
  return(basic_df)
}
