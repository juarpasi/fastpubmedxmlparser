#' Make a unique dataframe from a list of `dataframes` of the same PubMed data
#'
#' @param dfs ls. A list, typicall return by one `get_pm*` function.
#'
#' @return df. A table with the same columns
#' @export
#'
#' @examples
#' system.file("extdata", "pubmed_male_cancer_10.txt", package = "fastpubmedxmlparser") |>
#'   readPubmedFiles() |>
#'   get_pm_keywords() |>
#'   pubmed_list2df()
pubmed_list2df <- function(dfs) {Map(add_pmid, df = dfs, id = names(dfs)) |> Reduce(f = \(x, y) merge(x, y, all = T))}

# Helpers -----------------------------------------------------------------

#add pmid to a dataframe
add_pmid <- function(df, id) cbind(df, PMID = id)
