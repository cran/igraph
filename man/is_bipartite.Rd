% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/attributes.R
\name{is_bipartite}
\alias{is_bipartite}
\title{Checks whether the graph has a vertex attribute called \code{type}.}
\usage{
is_bipartite(graph)
}
\arguments{
\item{graph}{The input graph}
}
\description{
It does not check whether the graph is bipartite in the
mathematical sense.  Use \code{\link[=bipartite_mapping]{bipartite_mapping()}} for that.
}
\seealso{
Bipartite graphs
\code{\link{bipartite_mapping}()},
\code{\link{bipartite_projection}()},
\code{\link{make_bipartite_graph}()}
}
\concept{bipartite}
