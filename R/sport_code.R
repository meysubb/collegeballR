#' Reference Sport ID's
#'
#' The NCAA website uses different "sport id's" for
#' each sport. This function references those baesd on name.
#' @param sprt Tradiational Sport Name
#' @keywords Sport Code Lookup
#' @export
#' @examples
#' sport_code("mens basketball")
#' sport_code("MBB")
#'
#' sport_code("Women's Soccer")

sport_code <- function(sprt){
  if(nchar(sprt) == 3){
    ind <- which(sprt == sport_df$id)
    if(length(ind) > 0){
      sport_code <- sport_df$id[ind]
    }else{
      stop("Invalid Sport Choice")
    }
  }
  else{
    sprt <- gsub('[[:punct:]]', '', sprt)
    sport_lower <- tolower(sprt)
    ind <- which(sport_lower == sport_df$names)
    if(length(ind) > 0){
      sport_code <- sport_df$id[ind]
    }else{
      stop("Invalid Sport Choice")
    }
  }
  return(sport_code)
}
