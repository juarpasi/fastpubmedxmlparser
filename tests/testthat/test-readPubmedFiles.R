test_that('readPubmedFiles returns a string', {

  record <- readRDS(test_path("pubmed_files", "ten_records.rds")) |>
    readPubmedFiles()

  expect_type(record, 'character')
})

test_that('Work with PubMed xml files', {

  record <- readRDS(test_path("pubmed_files", "ten_records.rds")) |>
    readPubmedFiles()

  expect_length(record,10)
})

test_that("readPubmedFiles When a file does not exist", {
  expect_error(readPubmedFiles('a-file-doesnt-exists'), 'not exist')
})

test_that("If the file is not a xml format", {
  path <- withr::local_tempfile(
    pattern = "Universit\u00e0-",
    lines = c("# This is a markdown file\n", '_Hello_ **world**')
  )
  expect_error(readPubmedFiles(path), "Start tag expected")
})
