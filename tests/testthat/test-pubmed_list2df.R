test_that("Merging named list of datafraes", {

  l <- list(id1 = data.frame(text = 'a'),
            id2 = data.frame(text = 'b'),
            id3 = data.frame(text = 'c'))

  df <- data.frame(PMID = c('id1','id2','id3'),
                   text = c('a','b','c'))

  expect_equal(pubmed_list2df(l), df)
})

test_that("Merging named list of datafraes with NULLs dfs", {

  l <- list(id1 = data.frame(text = 'a'),
            id2 = NULL,
            id3 = data.frame(text = 'c'))

  df <- data.frame(PMID = c('id1','id2','id3'),
                   text = c('a',NA,'c'))

  expect_equal(pubmed_list2df(l), df)
})

test_that("Merging named list of datafraes with multiples columns", {

  l <- list(id1 = data.frame(text = 'a', type = 't1'),
            id3 = data.frame(text = 'c', type = 't2'))

  df <- data.frame(PMID = c('id1','id3'),
                   text = c('a','c'),
                   type = c('t1','t2'))

  expect_equal(pubmed_list2df(l), df)
})
