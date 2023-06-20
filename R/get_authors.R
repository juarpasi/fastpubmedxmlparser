#' Extract the author data from a unique PubMed xml record character
#'
#' @param doc str. An PubMed xml record of one record.
#'
#' @return df. Author data included: laste name, fore name, initial and affiliation
#' @export
#'
#' @examples
#'
#' system.file("extdata", "one_record_male_cancer01.txt", package = "fastpubmedxmlparser") |>
#'   readPubmedFiles() |>
#'   get_authors()

get_authors <- function(doc) {

  authors <- doc |>
    xml2::read_xml() |>
    xml2::xml_find_all(xpath = './/AuthorList//Author')
  doc <- NULL

  if (length(authors) == 0) return(NULL)

  df <- data.frame(LastName = character(), ForeName = character(),
                   Initials = character(), Affiliation = character())

  for (author in authors) {
    LastName <- author |> find_text_for('.//LastName')()
    ForeName <- author |> find_text_for('.//ForeName')()
    Initials <- author |> find_text_for('.//Initials')()
    Affiliation <- author |> find_text_for('.//Affiliation')()

    new_df <- data.frame(LastName, ForeName, Initials, Affiliation)
    df <- rbind(df, new_df)
  }

  authors <- NULL

  return(df)
}
