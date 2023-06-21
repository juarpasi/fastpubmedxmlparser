#' Get a dataframe from a list of nodes for a unique PubMed record.
#'
#' @description
#' The functions `get_nodedf_*` all are derived functions from `create_node_to_df`.
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
#'   get_nodedf_mesh_description()
get_nodedf_keywords <- create_node_to_df('.//MedlineCitation//KeywordList//Keyword', 'MajorTopicYN')

#' @export
#' @rdname get_nodedf_keywords
get_nodedf_mesh_description <- create_node_to_df('.//MedlineCitation//MeshHeadingList//DescriptorName', c('MajorTopicYN','UI'))

#' @export
#' @rdname get_nodedf_keywords
get_nodedf_mesh_qualifier <- create_node_to_df('.//MedlineCitation//MeshHeadingList//QualifierName', c('MajorTopicYN','UI'))

#' @export
#' @rdname get_nodedf_keywords
get_nodedf_article_ids <- create_node_to_df('.//PubmedData/ArticleIdList/ArticleId', 'IdType')

#' @export
#' @rdname get_nodedf_keywords
get_nodedf_publication_type <- create_node_to_df('.//Article//PublicationTypeList//PublicationType', 'UI')
