test_that("bipartite_projection works", {
  local_rng_version("3.5.0")
  withr::local_seed(42)

  g <- make_full_bipartite_graph(10, 5)
  proj <- bipartite_projection(g)
  expect_true(graph.isomorphic(proj[[1]], make_full_graph(10)))
  expect_true(graph.isomorphic(proj[[2]], make_full_graph(5)))

  M <- matrix(0, nrow = 5, ncol = 3)
  rownames(M) <- c("Alice", "Bob", "Cecil", "Dan", "Ethel")
  colnames(M) <- c("Party", "Skiing", "Badminton")
  M[] <- sample(0:1, length(M), replace = TRUE)
  M
  g2 <- graph_from_biadjacency_matrix(M)
  expect_that(as.matrix(g2[1:5, 6:8]), equals(M))
  expect_that(as.matrix(g2[1:5, 1:5]), is_equivalent_to(matrix(0, 5, 5)))
  expect_that(as.matrix(g2[6:8, 6:8]), is_equivalent_to(matrix(0, 3, 3)))

  g2$name <- "Event network"
  proj2 <- bipartite_projection(g2)
  expect_that(
    as.matrix(proj2[[1]][]),
    is_equivalent_to(cbind(
      c(0, 2, 0, 2, 2), c(2, 0, 1, 2, 2),
      c(0, 1, 0, 0, 0), c(2, 2, 0, 0, 2),
      c(2, 2, 0, 2, 0)
    ))
  )
  expect_that(
    as.matrix(proj2[[2]][]),
    is_equivalent_to(cbind(c(0, 4, 1), c(4, 0, 1), c(1, 1, 0)))
  )

  bs <- bipartite_projection_size(g2)
  expect_that(bs$vcount1, equals(vcount(proj2[[1]])))
  expect_that(bs$ecount1, equals(ecount(proj2[[1]])))
  expect_that(bs$vcount2, equals(vcount(proj2[[2]])))
  expect_that(bs$ecount2, equals(ecount(proj2[[2]])))
})

test_that("bipartite_projection can calculate only one projection", {
  withr::local_seed(42)

  g <- sample_bipartite(5, 10, p = .3)
  proj <- bipartite_projection(g)
  proj1 <- bipartite_projection(g, which = "false")
  proj2 <- bipartite_projection(g, which = "true")

  expect_true(graph.isomorphic(proj$proj1, proj1))
  expect_true(graph.isomorphic(proj$proj2, proj2))
  expect_that(vertex.attributes(proj$proj1), equals(vertex.attributes(proj1)))
  expect_that(vertex.attributes(proj$proj2), equals(vertex.attributes(proj2)))
  expect_that(edge_attr(proj$proj1), equals(edge_attr(proj1)))
  expect_that(edge_attr(proj$proj2), equals(edge_attr(proj2)))
})

test_that("bipartite_projection removes 'type' attribute if requested", {
  g <- make_full_bipartite_graph(10, 5)
  proj <- bipartite_projection(g)
  proj1 <- bipartite_projection(g, which = "true")
  proj2 <- bipartite_projection(g, which = "false")

  proj3 <- bipartite_projection(g, remove.type = FALSE)
  proj4 <- bipartite_projection(g, which = "true", remove.type = FALSE)
  proj5 <- bipartite_projection(g, which = "false", remove.type = FALSE)

  expect_false("type" %in% vertex_attr_names(proj[[1]]))
  expect_false("type" %in% vertex_attr_names(proj[[2]]))
  expect_false("type" %in% vertex_attr_names(proj1))
  expect_false("type" %in% vertex_attr_names(proj2))

  expect_true("type" %in% vertex_attr_names(proj3[[1]]))
  expect_true("type" %in% vertex_attr_names(proj3[[2]]))
  expect_true("type" %in% vertex_attr_names(proj4))
  expect_true("type" %in% vertex_attr_names(proj5))
})

test_that("bipartite_projection breaks for non-bipartite graphs (#543)", {
  g <- graph_from_literal(A - 0, B - 1, A - 1, 0 - 1)
  V(g)$type <- V(g)$name %in% LETTERS

  expect_that(
    bipartite_projection_size(g),
    throws_error("Non-bipartite edge found in bipartite projection")
  )
  expect_that(
    bipartite_projection(g),
    throws_error("Non-bipartite edge found in bipartite projection")
  )
})

test_that("bipartite_projection prints a warning if the type attribute is non-logical (#476)", {
  g <- make_full_bipartite_graph(10, 5)
  V(g)$type <- as.numeric(V(g)$type)
  expect_warning(bipartite_projection(g), "logical")
  expect_warning(bipartite_projection_size(g), "logical")
})
