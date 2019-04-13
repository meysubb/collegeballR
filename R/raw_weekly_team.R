#' Extract Raw Weekly Data
#' Includes both team and player data per game
#' This is further cleaned when the team or player functions are called
#'
#' Extracts raw game by game data.
#' @param team_id Team ID (form team_mapping)
#' @param sprt Tradiational Sport Name
#' @param yr Select year, (example: 2015-2016 season is 2016)
#' @keywords internal
#' @importFrom foreach "foreach"
#' @importFrom foreach "%do%"
#' @importFrom utils "setTxtProgressBar"
#' @importFrom utils "txtProgressBar"
#' @export
#' @examples
#'


.raw_weekly_team <- function(team_id,year,sport){
  df <- .extract_base_schedule(team_id,year,sport)
  year_id <- .year_ref(year,sport)
  base_url <- paste0("http://stats.ncaa.org/player/game_by_game?game_sport_year_ctl_id=",year_id,"&org_id=",team_id,"&stats_player_seq=-100")
  href <- read_html(base_url) %>%
    html_nodes(".smtext .skipMask") %>%
    html_attr("href")
  actual_len = length(href)/2
  if(actual_len == nrow(df)){
    df$href <- href[!grepl("*[#]", href)]
  }else{
    stop("There seems to be an issue with the URL accessed, please report as a GH issue")
  }
  teams <- team_mapping(2016,sport)
  t_name <- teams$team_name[which(team_id == teams$team_id)]
  #pb <- txtProgressBar(0, nrow(df), style = 2)
  raw_week_df <- foreach(i = 1:nrow(df), .combine='rbind') %do% {
    #setTxtProgressBar(pb, i)
    team_url <- paste0("http://stats.ncaa.org",df$href[i])
    team_names <- read_html(team_url) %>% html_nodes(".mytable .heading td") %>% html_text() %>% trimws()
    ind <- which(team_names == t_name)
    team_tbls <- read_html(team_url) %>% html_nodes(".mytable") %>% html_table()
    res_df <- team_tbls[[ind+1]]
    res_df <- res_df[-1,]
    colnames(res_df) <- res_df[1,]
    res_df <- res_df[-1,]
    game_details <- read_html(team_url) %>% html_nodes("#contentarea > table:nth-child(7)") %>% html_table()
    game_details <- game_details[[1]]
    res_df$opponent <- team_names[-ind]
    res_df$game_date <- as.Date(game_details[1,2],format="%m/%d/%Y")
    res_df$location <- game_details[2,2]
    res_df$team <- t_name
    res_df
  }
  raw_week_df <- raw_week_df %>% select(Player,team,opponent,game_date,everything(),location)
  return(raw_week_df)
}
