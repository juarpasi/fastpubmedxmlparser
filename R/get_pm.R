#' Extract metadata from a record list
#'
#' @param str_list chr. A chr vector with multiple vect. Usually extracted from `readPubmedFiles` function.
#'
#' @return A list of the same length of str_list paragram
#'
#' @export
#'
#' @examples
#' system.file("extdata", "one_record_male_cancer01.txt", package = "fastpubmedxmlparser") |>
#'   get_pm_abstract() |>
#'   pubmed_list2df()
#'
get_pm_authors <- create_get_pm_fun(get_authors)

#' @export
#' @rdname get_pm_authors
get_pm_abstract <- create_get_pm_fun(get_abstract)
