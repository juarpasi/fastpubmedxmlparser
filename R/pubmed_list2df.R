#' Create a single dataframe from a list of dataframes containing the same PubMed data
#'
#' @param dfs list. A list of dataframes, typicall return by one of the `get_pm*` functions.
#'
#' @return df. A dataframe that combines the columns from the input list of dataframes.
#' @export
#'
#' @examples
#' system.file("extdata", "pubmed_male_cancer_10.txt", package = "fastpubmedxmlparser") |>
#'   readPubmedFiles() |>
#'   get_pm_keywords() |>
#'   pubmed_list2df()
#'
pubmed_list2df <- function(dfs) {
  Map(add_pmid, df = dfs, id = names(dfs)) |>
    Reduce(f = \(x, y) merge(x, y, all = TRUE))
  }

# Helpers -----------------------------------------------------------------

#add PMID to a dataframe
add_pmid <- function(df, id) cbind(PMID = id, df)
