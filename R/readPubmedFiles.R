#' #' Read a XML PubMed file into character strings
#'
#' @description This function reads an XML PubMed file and split it into strings
#' by the PubmedArticle tag.
#'
#' @param file_path chr vector. The path for the PubMed record file.
#'
#' @return A character vector, with each PubMed record represented as a string.
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
#' readPubmedFiles() |>
#' str()
#'
#' @seealso [get_pm_authors], [get_pm_abstract], and all the `get_pm_*`
#' functions for futher analysis.
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

