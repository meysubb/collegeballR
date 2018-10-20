#' Sport Code Reference
#'
#' A dataset mapping the sport names to the NCAA sport id's.
#' This is helpful in cross-refrencing what sport you want to get.
#'
#' @format A data frame with 17 rows and 2 variables:
#' \describe{
#'   \item{names}{Full name of sports}
#'   \item{id}{Sport code that NCAA uses to identify the Sport Names}
#'   ...
#' }
#' @source \url{http://stats.ncaa.org}
"sport_df"

#' Season Mapping to Years
#'
#' This dataframes helps identify the year_id for each sport and its season.
#' This year_id is used intermally to find the correct urls on NCAA stats website.
#'
#' @format A data frame with 92 rows and 4 variables:
#' \describe{
#'   \item{season}{Sport Season}
#'   \item{id}{Year referencing the Season}
#'   \item{sport}{Sport Code}
#'   \item{year_id}{Year ID}
#'   ...
#' }
#' @source \url{http://stats.ncaa.org}
"year_df"


#' College Football Mapping for Play Types
#'
#' This dataframes helps identifies all play types identified in the play by play data.
#' This can be used to filter out play types when calling functions before hand.
#'
#'
#' @format A data frame with 45 rows and 3 variables:
#' \describe{
#'   \item{id}{Referencing play id}
#'   \item{text}{play type description}
#'   \item{abberivation}{play type abberivation used for function call}
#'   ...
#' }
#' @source \url{https://api.collegefootballdata.com}
"cfb_play_type_df"


#' College Football Conference
#'
#' This dataframes is used internally to identify conference names and use the abberivation in the function call for data
#'
#'
#' @format A data frame with 11 rows and 4 variables:
#' \describe{
#'   \item{id}{Referencing conference id}
#'   \item{name}{Conference name}
#'   \item{short_name}{Short name for Conference}
#'   \item{abberivation}{Conference abberivation}
#'   ...
#' }
#' @source \url{https://api.collegefootballdata.com}
"cfb_conf_types_df"
