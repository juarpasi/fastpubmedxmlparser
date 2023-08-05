test_that("get_pm return a list", {

  records <- readRDS(test_path("pubmed_files", "ten_records.rds")) |>
    readPubmedFiles() |>
    get_pm_abstract()

  expect_type(records, 'list')
})

test_that("All objects in get_pm are dataframes", {

  all_are_dataframes <- readRDS(test_path("pubmed_files", "ten_records.rds")) |>
    readPubmedFiles() |>
    get_pm_abstract() |>
    Map(f = is.data.frame) |>
    Reduce(f = c) |>
    all()

  expect_true(all_are_dataframes)
})

test_that("get_pm_authors is different from get_pm", {

  authors <- readRDS(test_path("pubmed_files", "single_record.rds")) |>
    readPubmedFiles() |>
    get_pm_authors()

  has_all_names <- c('LastName', 'ForeName', 'Initials', 'Affiliation') %in% names(authors[[1]]) |>
    all()

  expect_true(has_all_names)
  expect_s3_class(authors[[1]], "data.frame")
})
