test_that("sample_smallworld works", {
  for (i in 1:50) {
    p <- runif(1)
    d <- sample(1:3, 1)
    nei <- sample(2:5, 1)
    g <- sample_smallworld(d, 10, nei, p, loops = FALSE)
    expect_false(any(which_loop(g)))
  }
})
