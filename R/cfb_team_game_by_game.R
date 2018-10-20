#' Extract Team Stats for a CFB team game-by-game for the season
#'
#' Option to select data per season or per game
#' @param team_id Team ID (form team_mapping)
#' @param sport Tradiational Sport Name
#' @param year Select year, (example: 2015-2016 season is 2016)
#' @keywords Team Stats
#' @export
#' @examples
#' .cfb_team_game_by_game(697,2018,sprt="MFB")
#'

.cfb_team_game_by_game <- function(team_id,year,sprt="MFB"){
  ### check sport code first
  sport <- sport_code(sprt)
  ### Some pre-processing get base schedule and HREF Urls
  df <- .extract_base_schedule(team_id,year,sport)
  year_id <- .year_ref(year,sport)
  base_url <- paste0("http://stats.ncaa.org/player/game_by_game?game_sport_year_ctl_id=",year_id,"&org_id=",team_id,"&stats_player_seq=-100")
  href <- read_html(base_url) %>%
    html_nodes(".smtext .skipMask") %>%
    html_attr("href")
  ### remove hashtags
  clean_href <- gsub("\\#.*","",href)
  clean_href <- clean_href[clean_href != ""]
  actual_len = length(clean_href)
  if(actual_len == nrow(df)){
    ### extract the following text
    pre_string <- "http://data.ncaa.com/sites/default/files/data/game/football/fbs/"
    extract_href <- gsub(".*fbs/","",clean_href)
    df$href <- paste0(pre_string,extract_href)
  }

  ## extract and store team names
  teams <- team_mapping(year,sport)
  t_name <- teams$team_name[which(team_id == teams$team_id)]


  ### Extract data per game
  ### use purrr safely to avoid potential URL errors
  data_df <- df %>% mutate(
    t_stats = purrr::map2(href,Date,purrr::safely(.cfb_team_stats_by_game)),
    t_stats = sapply(t_stats,function(x){x[[1]]})
  )

  null_warning_ind <- unlist(lapply(data_df$t_stats,is.null))
  data_errors <- paste0(t_name,"-",data_df[null_warning_ind,"Opponent"])
  ### Need to print this out and return
  keep_data <- data_df[!null_warning_ind,] %>% select(-href)
  keep_data <- keep_data %>% mutate(team = t_name)
  merge_dat <- keep_data %>% select()

  game_stats <- keep_data %>% select(t_stats) %>% tidyr::unnest()
  final_df <- tidyr::spread(data = game_stats,
                            key = stat,
                            value = data) %>% arrange(date)
  if(length(data_errors)>0){
    warnings(data_errors)
  }
  return(final_df)
}


### helper function
.cfb_team_stats_by_game <- function(url,dat){
  require(jsonlite)
  post_string_options <- "/teamStats.json"
  full_url <- paste0(url,post_string_options)

  ### need assert statement to basically skip everything and return NULL
  ### if the JSON hits a 404 error
  team_json <- fromJSON(full_url)
  team_info  <- team_json$meta$teams
  team_names <- team_info %>% pull(shortname)

  l_teams <- team_json$teams$stats
  len <- length(l_teams)
  stat_df <- data.frame()
  for(i in 1:len){
    df <- .cfb_clean_game_stats(l_teams[[i]])
    df$name <- team_names[[i]]
    stat_df <- rbind(stat_df,df)
  }
  stat_df$date <- dat
  return(stat_df)
}

### another helper function
### clean individual game team stats
.cfb_clean_game_stats <- function(df){
  main_stat <- df
  add_lst <- df$breakdown
  names(add_lst) <- main_stat$stat
  main_stat$breakdown <- NULL
  add_df <- dplyr::bind_rows(add_lst,.id="id")
  add_df$stat <- paste0(add_df$id,"_",add_df$stat)
  add_df$id <- NULL
  stat_df <- rbind(main_stat,add_df)
}
