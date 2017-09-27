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
