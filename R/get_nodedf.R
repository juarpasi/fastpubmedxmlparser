#' Get a dataframe from a single node for a unique PubMed record.
#'
#' @description
#' The functions `get_nodedf_*` all are derived functions from `create_node_to_df`.
#'
#' These find all the first nodes for a specific `xpath` and return the text of such node.
#'
#' It only works in a vector of length 1.
#'
#' @param doc chr. A PubMed record in xml format
#'
#' @return
#'  * df. The first column is the node name.
#'  * `NULL` in case the node has no name.
#' @export
#'
#' @examples
#'system.file("extdata", "one_record_male_cancer01.txt", package = "fastpubmedxmlparser") |>
#'   readPubmedFiles() |>
#'   get_nodedf_journal()
get_nodedf_journal <- create_node_to_df('.//MedlineCitation//Article//Title')

#' @export
#' @rdname get_nodedf_journal
get_nodedf_country <- create_node_to_df('.//MedlineJournalInfo//Country')

#' @export
#' @rdname get_nodedf_journal
get_nodedf_language <- create_node_to_df('.//Article//Language')

#' @export
#' @rdname get_nodedf_journal
get_nodedf_title <- create_node_to_df('.//ArticleTitle')

#' @export
#' @rdname get_nodedf_journal
get_nodedf_year <- create_node_to_df('.//Article//Journal//JournalIssue//PubDate//Year')
