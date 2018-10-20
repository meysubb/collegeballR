#' Extract overall team stats for a CFB team (one season)
#'
#' Option to select data per season or per game
#' @param team_id Team ID (form team_mapping)
#' @param sport Tradiational Sport Name
#' @param year Select year, (example: 2015-2016 season is 2016)
#' @keywords Team Stats
#' @export
#' @examples
#'
#' .cfb_team_season(697,2018,sprt="MFB")
#'

.cfb_team_season <- function(team_id,year,sprt="MFB"){
  base_url <- "http://stats.ncaa.org"
  year_id <- .year_ref(year,sprt)
  url <- paste0(base_url,"/team/",team_id,"/stats/",year_id)
  headers <- read_html(url) %>% html_nodes(".heading td > a") %>% html_text()
  header_href <- read_html(url) %>% html_nodes(".heading td > a") %>% html_attr("href")
  head_df <- data.frame(headers,header_href)
  search <- c("Total Offense","Tackles","Kicking",
              "Punting","Punt Returns","Kickoffs and KO Returns",
              "Defense","Redzone","Scoring")

  url_df <- head_df[head_df$headers %in% search,]
  url_df <- url_df %>% mutate(
    full_url = paste0(base_url,header_href),
    stat_df = purrr::map(full_url,.scrape_overall_stats)
  )

  test <- url_df %>% select(stat_df) %>% tidyr::unnest()
  test[,-2] <- lapply(test[,-2], function(x) as.numeric(gsub(",", "", x)))
  ## "Opponent firt
  test$Player <- as.factor(test$Player)
  levels(test$Player) <- c(1,2)
  test$Player <- as.numeric(test$Player)
  s <- aggregate(x=test, by=list(test$Player), sum, na.rm = TRUE)
  s$Player <- NULL
  s[s$Group.1!=1,"Group.1"] <- "Team"
  s[s$Group.1==1,"Group.1"] <- "Opponent"
  ### return S and should be good
  return(s)
}



# url_df <- head_df[head_df$headers %in% search,]

### grab the header and the ovearl stats (team and opponnet)
.scrape_overall_stats <- function(t_url){
  stat_head <- read_html(t_url) %>% html_nodes("th") %>% html_text()
  len <- length(stat_head)
  stat_value <- read_html(t_url) %>% html_nodes(".grey_heading td") %>% html_text()
  stat_df <- as.data.frame(matrix(stat_value,ncol=len,byrow = T))

  colnames(stat_df) <- stat_head
  return(stat_df)
}

