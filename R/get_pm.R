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
#'   readPubmedFiles() |>
#'   get_pm_abstract() |>
#'   str()
#'
#' system.file("extdata", "pubmed_male_cancer_10.txt", package = "fastpubmedxmlparser") |>
#'   readPubmedFiles() |>
#'   get_pm_pub_type() |>
#'   str()
#'
get_pm_authors <- create_get_pm_fun(get_authors)

#' @export
#' @rdname get_pm_authors
get_pm_abstract <- create_get_pm_fun(get_abstract)

#' @export
#' @rdname get_pm_authors
get_pm_keywords <- create_get_pm_fun(get_nodesdf_keywords)

#' @export
#' @rdname get_pm_authors
get_pm_mesh_des <- create_get_pm_fun(get_nodesdf_mesh_description)

#' @export
#' @rdname get_pm_authors
get_pm_mesh_qua <- create_get_pm_fun(get_nodesdf_mesh_qualifier)

#' @export
#' @rdname get_pm_authors
get_pm_paper_ids <- create_get_pm_fun(get_nodesdf_article_ids)

#' @export
#' @rdname get_pm_authors
get_pm_pub_type <- create_get_pm_fun(get_nodesdf_publication_type)

#' @export
#' @rdname get_pm_authors
get_pm_journal <- create_get_pm_fun(get_nodedf_journal)

#' @export
#' @rdname get_pm_authors
get_pm_country <- create_get_pm_fun(get_nodedf_country)

#' @export
#' @rdname get_pm_authors
get_pm_language <- create_get_pm_fun(get_nodedf_language)

#' @export
#' @rdname get_pm_authors
get_pm_title <- create_get_pm_fun(get_nodedf_title)

#' @export
#' @rdname get_pm_authors
get_pm_year <- create_get_pm_fun(get_nodedf_year)
