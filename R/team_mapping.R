#' Team Name to Team ID Reference
#'
#' The NCAA website has a unique identifier for each time in
#' each sport. This function references those baesd on name.
#' @param sprt Tradiational Sport Name or Sport Code
#' @param yr Actual Year (example: 2016 or 2015)
#' @importFrom xml2 "read_html"
#' @importFrom magrittr "%>%"
#' @importFrom rvest "html_nodes"
#' @importFrom rvest "html_attr"
#' @importFrom rvest "html_text"
#' @keywords Find Teams
#' @export
#' @examples
#' team_mapping(2015,"Men's Basketball")
#' team_mapping(2015,"MBB")
#'
#' team_mapping(2016,"Womens Soccer")


team_mapping <- function(yr,sprt){
  s_code <- sport_code(sprt)
  if(s_code == "MFB"){
    url <- paste0("http://stats.ncaa.org/team/inst_team_list?academic_year=",yr,"&conf_id=-1&division=11&sport_code=",s_code)
  }else{
    url <- paste0("http://stats.ncaa.org/team/inst_team_list?academic_year=",yr,"&conf_id=-1&division=1&sport_code=",s_code)
  }
  tm <- read_html(url) %>%  html_nodes("a") %>% html_attr("href")
  tm_text <- read_html(url) %>% html_nodes("a") %>% html_text("href")
  if(length(tm) == length(tm_text)){
    ind <- grep("/team/",tm)
    team_df <- data.frame(team_id = tm[ind],team_name = tm_text[ind])
    team_df <- team_df[-grep("schedule_list?",team_df$team_id),]
    team_df <- team_df[-grep("inst_team_list?",team_df$team_id),]
    team_df$team_id <- sub(".*/(.*)/.*","\\1",team_df$team_id)
    team_df$year <- rep(yr,nrow(team_df))
    return(team_df)
  }else{
    print("There seems to be an issue with the url accessed. Try again later, if you believe this is an issue inherently please submit an issue report on github.")
  }

}
