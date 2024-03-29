% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interface.R
\name{add_vertices}
\alias{add_vertices}
\title{Add vertices to a graph}
\usage{
add_vertices(graph, nv, ..., attr = list())
}
\arguments{
\item{graph}{The input graph.}

\item{nv}{The number of vertices to add.}

\item{...}{Additional arguments, they must be named,
and they will be added as vertex attributes, for the newly added
vertices. See also details below.}

\item{attr}{A named list, its elements will be added
as vertex attributes, for the newly added vertices. See also details
below.}
}
\value{
The graph, with the vertices (and attributes) added.
}
\description{
If attributes are supplied, and they are not present in the graph,
their values for the original vertices of the graph are set to
\code{NA}.
}
\examples{
g <- make_empty_graph() \%>\%
  add_vertices(3, color = "red") \%>\%
  add_vertices(2, color = "green") \%>\%
  add_edges(c(
    1, 2,
    2, 3,
    3, 4,
    4, 5
  ))
g
V(g)[[]]
plot(g)
}
\seealso{
Other functions for manipulating graph structure: 
\code{\link{+.igraph}()},
\code{\link{add_edges}()},
\code{\link{complementer}()},
\code{\link{compose}()},
\code{\link{connect}()},
\code{\link{contract}()},
\code{\link{delete_edges}()},
\code{\link{delete_vertices}()},
\code{\link{difference}()},
\code{\link{difference.igraph}()},
\code{\link{disjoint_union}()},
\code{\link{edge}()},
\code{\link{igraph-minus}},
\code{\link{intersection}()},
\code{\link{intersection.igraph}()},
\code{\link{path}()},
\code{\link{permute}()},
\code{\link{rep.igraph}()},
\code{\link{reverse_edges}()},
\code{\link{simplify}()},
\code{\link{union}()},
\code{\link{union.igraph}()},
\code{\link{vertex}()}
}
\concept{functions for manipulating graph structure}
