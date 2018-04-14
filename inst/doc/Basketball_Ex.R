## ----message=FALSE,warning=FALSE-----------------------------------------
library(dplyr)
library(ggplot2)
library(ggrepel)
library(data.table)
library(collegeballR)
library(rvest)
sec_urls <- "http://stats.ncaa.org/team/inst_team_list?academic_year=2018&conf_id=911&division=1&sport_code=MBB"

team_names <- read_html(sec_urls) %>% html_nodes(".css-panes a") %>% html_text()
team_names <- trimws(team_names)
teams <- team_mapping(2018,"MBB")
sec <- teams %>% filter(team_name %in% team_names) %>% mutate(
  team_id = as.numeric(team_id)
)

sec_player_stats <- sec %>% mutate(
  team_id = as.numeric(team_id),
  player_df = purrr::map(team_id,player_stats,year=2018,sport="MBB")
)


## ----message=F-----------------------------------------------------------
sec_player_l <- sec_player_stats %>% select(player_df) %>% pull()

sec_player_df <- rbindlist(sec_player_l,fill=T) 
colnames(sec_player_df)[c(19,23)] <- c("PPG","RPG")
sec_player_df <- sec_player_df %>% inner_join(.,sec) %>% select(-G,-team_id)

## ------------------------------------------------------------------------
sec_player_df <- sec_player_df %>% mutate(
  MP = as.numeric(gsub("\\:.*","",MP)),
)

sec_player_df[,c("FGM","FGA","DRebs","Tot Reb")] <- sapply(sec_player_df[,c("FGM","FGA","DRebs","Tot Reb")],as.numeric)

## ------------------------------------------------------------------------
sec_p_df <- sec_player_df %>% group_by(team_name) %>% mutate(
  team_minutes = sum(MP,na.rm=T),
  team_FGA = sum(FGA,na.rm=T),
  team_FTA = sum(FTA,na.rm=T),
  team_TO =  sum(TO,na.rm=T)
) %>% ungroup() %>% as.data.frame()
sec_p_df[is.na(sec_p_df)] <- 0
sec_p_df <- sec_p_df %>% mutate(
  usg_rate = 100 * ((FGA + 0.475 * FTA + TO) * (team_minutes/5)) / (MP * (team_FGA + 0.475 * team_FTA + team_TO))
  )

## ----fig.height=6,fig.width=10-------------------------------------------
ind_df <- sec_p_df %>% filter(MP>100)
labels <- ind_df %>% filter(usg_rate>25 & MP > 750)
ggplot() +
  geom_point(data = ind_df, aes(y = MP, x = usg_rate, color = team_name)) + theme_bw() +
  geom_text_repel(data = labels, aes(x = usg_rate, y = MP, label = Player)) +
  facet_wrap(~team_name) + 
  labs(x = "Usage Rate", y = "Minutes", caption = "@msubbaiah1",
       title = "SEC Basketball Usage Rate by team",
       subtitle = "2017 - 2018 season") + 
  theme(legend.position = "none")
  

