#' Reference Year ID's
#'
#' The NCAA website uses different "year id's" for
#' each sport. This function cross-references based on sport and year selection.
#' @param sprt Tradiational Sport Name
#' @param yr Select year, (example: 2015-2016 season is 2016)
#' @importFrom dplyr "filter"
#' @keywords internal
#' @export
#' @examples
#' year_ref(2016,"mens basketball")
#' year_ref(2015,"MBB")
#'
#' year_ref(2015,"MBB")

.year_ref <- function(yr,sprt){
  sprt <- sport_code(sprt)
  year_df <- year_df %>% filter(sport == sprt)
  ind <- which(yr == year_df$id)
  if(length(ind)>0){
    year_id <- year_df$year_id[ind]
  }else{
    stop("Invalid Year Choice")
  }
  return(year_id)
}
