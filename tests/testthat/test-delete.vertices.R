test_that("delete_vertices works", {
  g <- graph_from_literal(A:B:C - D:E:F, D - E - F)

  g2 <- delete_vertices(g, "A")
  g3 <- delete_vertices(g, match("A", V(g)$name))

  expect_true(graph.isomorphic(g2, g3))
})
