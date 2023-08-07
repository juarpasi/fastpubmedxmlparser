#' Make `get_pm` function
#'
#' @noRd
#'
#' @description
#' The functions `get_nodesdf_*` and `get_nodedf_` work with a chr vector of length 1.
#' `create_get_pm_fun` can make that those functions can operate with vector of length > 1.
#' The `pm` means PubMed.
#'
#' @param f fun. This function cannot take a chr vector of length 1.
#'
#' @return fun. A function that take a chr vector (length >= 1) and apply the function `f`.
#'
#' @export
#'
#' @examples
#' get_pm_authors <- create_get_pm_fun(get_authors)
create_get_pm_fun <- function(f){function(str_list) lapply(str_list, f)}
