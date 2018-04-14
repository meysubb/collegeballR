## ----message=FALSE,warning=FALSE,echo=FALSE------------------------------
library(dplyr)
library(huxtable)
library(collegeballR)
table <- huxtable(sport_df,add_colnames = T) %>% 
  theme_article %>% 
  set_top_border(1, 1, 1) 
caption(table) <- "Table 1. Sports supported by collegeballR"
table

## ----message=FALSE,warning=FALSE-----------------------------------------
teams <- team_mapping(2016,"Men's Basketball")
head(teams,6)

## ------------------------------------------------------------------------
tamu_ws <- team_stats(697, 2015, "Women's Soccer",by="Season")
table2 <- huxtable(tamu_ws,add_colnames = T) %>% 
  theme_article %>% 
  set_top_border(1,1,1)
caption(table2) <- "Table 2. TAMU Women's Soccer 2015"
wrap(table2) <- TRUE
table2

## ------------------------------------------------------------------------
tamu_p_mbb <- player_stats(697, 2015, "MBB",by="Season")
table3 <- huxtable(tamu_p_mbb,add_colnames = T) %>% 
  theme_article %>% 
  set_top_border(1,1,1)
caption(table3) <- "Table 3. TAMU Men's Basketball 2015 - Player Stats"
wrap(table3) <- TRUE
table3

