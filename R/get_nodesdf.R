#' Get a dataframe from a list of nodes for a unique PubMed record.
#'
#' @description
#' The functions `get_nodesdf_*` all are derived functions from `create_nodes_to_df`.
#'
#' These find all the nodes for a specific `xpath`, and they also use the `attr` of those nodes.
#'
#' It only works in a vector of length 1.
#'
#' @param doc chr. A PubMed record in xml format
#'
#' @return
#'  * df. The first column is the node name, the rest has the value of each attribute.
#'  * `NULL` in case there is no nodes.
#' @export
#'
#' @examples
#'system.file("extdata", "one_record_male_cancer01.txt", package = "fastpubmedxmlparser") |>
#'   readPubmedFiles() |>
#'   get_nodesdf_mesh_description()
get_nodesdf_keywords <- create_nodes_to_df('.//MedlineCitation//KeywordList//Keyword', 'MajorTopicYN')

#' @export
#' @rdname get_nodesdf_keywords
get_nodesdf_mesh_description <- create_nodes_to_df('.//MedlineCitation//MeshHeadingList//DescriptorName', c('MajorTopicYN','UI'))

#' @export
#' @rdname get_nodesdf_keywords
get_nodesdf_mesh_qualifier <- create_nodes_to_df('.//MedlineCitation//MeshHeadingList//QualifierName', c('MajorTopicYN','UI'))

#' @export
#' @rdname get_nodesdf_keywords
get_nodesdf_article_ids <- create_nodes_to_df('.//PubmedData/ArticleIdList/ArticleId', 'IdType')

#' @export
#' @rdname get_nodesdf_keywords
get_nodesdf_publication_type <- create_nodes_to_df('.//Article//PublicationTypeList//PublicationType', 'UI')
