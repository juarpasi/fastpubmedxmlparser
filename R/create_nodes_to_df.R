#' Dynamic generation of XML nodes to dataframe Functions
#'
#' @noRd
#'
#' @description
#' `create_nodes_to_df` is a higher-order function, which partially apply the parameters.
#'
#' @param xpath chr. A path of the nodes in which search
#' @param attribs chr. The attributes that could be available in the `xpath`
#'
#' @return fun. For applications see a `get_nodesdf_*` function.
#' @export
#'
#' @examples
#' # nodeList2Df ----------------------------------------------------------------------
#' xml_text <- '<body>
#' <h2>A simple H1</h2>
#' <div>
#'   <buz col = "r" date = "2003">B1</buz>
#'   <buz col = "b" date = "2013" name = "foo">B2</buz>
#'   <buz col = "y" date = "2023">B3</buz>
#' </div>
#' <h2>A simple H2</h2>
#' <div>
#'   <buz col = "g" date = "2021">B4</buz>
#'   <buz col = "b" date = "2021" name = "foo2">B6</buz>
#'   <buz col = "c" date = "2023">B7</buz>
#' </div>
#' </body>'
#'
#' # Create an uncurried function for clarity
#' nodeList2Df <- function(doc, xpath, attribs) {
#'   f <- create_nodes_to_df(xpath, attribs)(doc)
#'   return(f)
#' }
#'
#' nodeList2Df(xml_text, xpath = './/div//buz', attribs = c('col','date'))
#'
#' nodeList2Df(xml_text, xpath = './/div//buz', attribs = 'name')
#'
#' # get_nodedf_* ----------------------------------------------------------------------
#'
#' # This function is used to generate the `get_nodesdf_*` functions
#' get_nodedf_mesh_description <- create_nodes_to_df('.//MedlineCitation//MeshHeadingList//DescriptorName', c('MajorTopicYN','UI'))
create_nodes_to_df <- function(xpath, attribs) {

  function(doc){
    #get nodes
    nodes <- doc |>
      xml2::read_xml() |>
      xml2::xml_find_all(xpath)

    if (length(nodes) == 0) return(NULL)

    #get text
    df <- data.frame(xml2::xml_text(nodes))
    names(df) <- nodes[[1]] |> xml2::xml_name()

    #get value of attr and add to dataframe
    for (att in attribs) {
      df[att] <- xml2::xml_attr(nodes, attr = att)
    }

    nodes <- NULL

    return(df)
  }

}
