#' Read a xml pubmed file into chr strings
#'
#' @description
#' Split the xml file into strings, according to the number of PubmedArticles that the XML file contains
#'
#' @param file_path chr vect. The path for the PubMed record.
#'
#' @return chr vect. With each record as a character vector
#' @export
#'
#' @examples
#' # From local file ----------------------------------------------------------------
#' if (FALSE){
#'
#' library(fastpubmedxmlparser)
#'
#' #Suppose you have a PubMed record in the pubmedData directory.
#' records <- 'pubmedData/your-pubmed-record.txt' |>
#'   readPubmedFiles()
#'
#' }
#'
#' # Using the file include in this pkg-----------------------------------------------
#' records <- system.file("extdata", "maleCancer.txt", package = "fastpubmedxmlparser") |>
#' readPubmedFiles()
#'
#' records |> str()
#'
#'
readPubmedFiles <- function(file_path) {

  records <- file_path |>
    xml2::read_xml(encoding = "UTF-8") |>
    # extract nodes with the tag PubmedArticle
    xml2::xml_find_all(".//PubmedArticle") |>
    as.character()

  #get ids
  pmids <- records |>
    lapply(xml2::read_xml) |>
    lapply(find_text_for('.//PMID'))

  names(records) <- pmids

  return(records)

}
