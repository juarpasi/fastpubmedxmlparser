#' Dynamic generation of a single XML node to dataframe Functions
#'
#' @noRd
#'
#' @description
#' This function is similar to `create_node_to_df` but it will use the first node.
#' The returning function, internally calls `xml2::xml_find_first`.
#'
#' @param xpath chr. A path of the node
#'
#' @return fun. For applications see a `get_nodedf_*` function
#' @export
#'
#' @examples
#' #This function is used to generate the `get_nodedf_*` functions
#' get_nodedf_title <- create_node_to_df('.//ArticleTitle')
create_node_to_df <- function(xpath) {

  function(doc){

    node <- doc |>
      xml2::read_xml() |>
      xml2::xml_find_first(xpath)

    name <- node |> xml2::xml_name()

    if (is.na(name)) return(NULL)

    df <- data.frame(xml2::xml_text(node))
    colnames(df) <- name

    node <- NULL
    return(df)
  }

}
