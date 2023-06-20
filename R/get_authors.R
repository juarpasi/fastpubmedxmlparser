
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

# Helpers -----------------------------------------------------------------

find_text_for <- \(xpath)\(xml_doc) xml2::xml_find_first(xml_doc, xpath)|> xml2::xml_text()
#note the reason why I use this with separated its beacuse I can pass within the `apply`

#add pmid to a dataframe
add_pmid <- function(df, id) cbind(df, PMID = id)

#list of dataframes 2 one dataframe.
pubmed_list2df <- function(df) Map(add_pmid, df, id = names(df)) |> Reduce(f = rbind)
