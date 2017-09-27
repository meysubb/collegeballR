#' Team Schedule and Results
#'
#' Returns a dataframe of the team's schedule and results.
#' Additional information includes: (1) site and (2) cumulative record
#' @param team_id Team ID from team_mapping
#' @param sport Tradiational Sport Name or Sport Code
#' @param year Actual Year (example: 2016 or 2015)
#' @importFrom magrittr "%>%"
#' @importFrom xml2 "read_html"
#' @importFrom dplyr "select"
#' @importFrom dplyr "everything"
#' @importFrom rvest "html_table"
#' @importFrom rvest "html_nodes"
#' @importFrom rvest "html_text"
#' @importFrom stringr "str_sub"
#' @keywords Team Schedule
#' @export
#' @examples
#' team_schedule(697,2016,"MBB")
#'
#' team_schedule(697,2015,"Womens Soccer")
#'

team_schedule <- function(team_id,year,sport){
  basic_df <- .extract_base_schedule(team_id,year,sport)
  basic_df$site <- ifelse(startsWith(basic_df$Opponent,"@"),"Away","Home")
  basic_df$site[grep("@",str_sub(basic_df$Opponent, 2, -2))] <- "Neutral"
  teams <- team_mapping(2016,"MBB")
  team_name <- teams$team_name[which(team_id == teams$team_id)]
  basic_df$team <- team_name
  basic_df$result <- substr(basic_df$Score,1,1)
  basic_df$OT <- gsub("(?<=\\()[^()]*(?=\\))(*SKIP)(*F)|.", "", basic_df$Score, perl=T)
  basic_df$OT <- ifelse(basic_df$OT == "",NA,basic_df$OT)
  basic_df$Score <- gsub("\\([^()]*\\)", "", str_sub(basic_df$Score,3,-1))
  basic_df$team_score <- as.numeric(trimws(sub("-.*", "", basic_df$Score)))
  basic_df$opp_score <- as.numeric(trimws(sub(".*-", "", basic_df$Score)))
  basic_df$win <- cumsum(ifelse(basic_df$result == "W",1,0))
  basic_df$loss <- cumsum(ifelse(basic_df$result == "L",1,0))
  basic_df <- basic_df %>% select(team,Date,Opponent,site,OT,result,Score,everything())
  return(basic_df)
}
