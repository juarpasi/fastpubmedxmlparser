#' Make `get_pm` function
#'
#' @param f fun. A function that take one chr
#'
#' @return fun. A function that take a chr vector with length of one or more and apply the function `f`.
#'
#' @export
#'
#' @examples
#' get_pm_authors <- create_get_pm_fun(get_authors)
create_get_pm_fun <- function(f){function(str_list) lapply(str_list, f)}
