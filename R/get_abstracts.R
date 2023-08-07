#' Extract the abstracts with associated data from one PubMed record
#'
#' @noRd
#'
#' @param doc str. An PubMed xml record of one record.
#'
#' @return df. A table with the text, label and Nlm category
#' @export
#'
#' @examples
#'
#' system.file("extdata", "one_record_male_cancer01.txt", package = "fastpubmedxmlparser") |>
#'   readPubmedFiles() |>
#'   get_abstract()

get_abstract <- function(doc) {

  #get nodes
  nodes <- doc |>
    xml2::read_xml() |>
    xml2::xml_find_all('.//MedlineCitation//Article//Abstract//AbstractText')

  if (length(nodes) == 0) return(NULL)

  #get text
  df <- data.frame(text = xml2::xml_text(nodes))

  attribs <- c('Label','NlmCategory')

  #get value of attr and add to dataframe
  for (att in attribs) {
    df[att] <- xml2::xml_attr(nodes, attr = att)
  }

  nodes <- NULL

  return(df)
}
