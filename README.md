
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fastpubmedxmlparser

<!-- badges: start -->
<!-- badges: end -->

This package is designed to parse PubMed records retrieved from NCBI and
convert them into data frames.

## Installation

You can install the development version of fastpubmedxmlparser like so:

``` r
# install.packages("devtools")
devtools::install_github("juarpasi/fastpubmedxmlparser")
```

## Example

For a single record you can use the `get_pm_*` functions.

``` r
library(fastpubmedxmlparser)

fastpubmedxmlparser::single_record |>
  get_pm_title() |>
  getElement(1)
#>                                                 ArticleTitle
#> 1 Barriers to pain management among adolescents with cancer.

fastpubmedxmlparser::single_record |>
  get_pm_mesh_des() |>
  getElement(1)
#>                DescriptorName MajorTopicYN      UI
#> 1   Adaptation, Psychological            N D000223
#> 2                  Adolescent            N D000293
#> 3                  Analgesics            N D000700
#> 4          Attitude to Health            N D001294
#> 5                       Child            N D002648
#> 6                      Female            N D005260
#> 7                      Humans            N D006801
#> 8                        Male            N D008297
#> 9                   Neoplasms            Y D009369
#> 10           Oncology Nursing            N D009859
#> 11                       Pain            Y D010146
#> 12     Psychology, Adolescent            N D000297
#> 13            Quality of Life            N D011788
#> 14 Surveys and Questionnaires            N D011795
```

For multiple records the `readPubmedFiles` and the `pubmed_list2df` can
be use to obtain a single dataframe

``` r
fastpubmedxmlparser::ten_records |>
  readPubmedFiles() |>
  get_pm_country() |>
  pubmed_list2df()
#>        PMID       Country
#> 1  20104969      Thailand
#> 2  20104990      Thailand
#> 3  20132215       England
#> 4  20169277        Brazil
#> 5  20183385       England
#> 6  20218134         Egypt
#> 7  20218142         Egypt
#> 8  20237899   Netherlands
#> 9  20974066 United States
#> 10 21095597 United States

fastpubmedxmlparser::ten_records |>
  readPubmedFiles() |>
  get_pm_year() |>
  pubmed_list2df()
#>        PMID Year
#> 1  20104969 2009
#> 2  20104990 2009
#> 3  20132215 2010
#> 4  20169277 2009
#> 5  20183385 2009
#> 6  20218134 2009
#> 7  20218142 2009
#> 8  20237899 2010
#> 9  20974066 2011
#> 10 21095597 2010
```
