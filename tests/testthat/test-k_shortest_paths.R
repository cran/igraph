test_that("k_shortest_paths works", {
  g <- make_ring(5)
  res <- k_shortest_paths(g, 1, 2, k = 3)
  expect_length(res$vpaths, 2)
  expect_length(res$epaths, 2)
  expect_equal(as.numeric(res$vpaths[[1]]), c(1, 2))
  expect_equal(as.numeric(res$epaths[[1]]), c(1))
  expect_equal(as.numeric(res$vpaths[[2]]), c(1, 5, 4, 3, 2))
  expect_equal(as.numeric(res$epaths[[2]]), c(5, 4, 3, 2))
})

test_that("k_shortest_paths works with weights", {
  g <- make_graph(c(1,2, 1,3, 3,2))
  E(g)$weight <- c(5, 2, 1)
  res <- k_shortest_paths(g, 1, 2, k = 3)
  expect_length(res$vpaths, 2)
  expect_length(res$epaths, 2)
  expect_equal(as.numeric(res$vpaths[[1]]), c(1, 3, 2))
  expect_equal(as.numeric(res$epaths[[1]]), c(2, 3))
  expect_equal(as.numeric(res$vpaths[[2]]), c(1, 2))
  expect_equal(as.numeric(res$epaths[[2]]), c(1))
})
