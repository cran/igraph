% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flow.R
\name{is_separator}
\alias{is_separator}
\title{Vertex separators}
\usage{
is_separator(graph, candidate)
}
\arguments{
\item{graph}{The input graph. It may be directed, but edge directions are
ignored.}

\item{candidate}{A numeric vector giving the vertex ids of the candidate
separator.}
}
\value{
A logical scalar, whether the supplied vertex set is a (minimal)
vertex separator or not.
lists all vertex separator of minimum size.
}
\description{
Check whether a given set of vertices is a vertex separator.
}
\details{
\code{is_separator()} decides whether the supplied vertex set is a vertex
separator. A vertex set is a vertex separator if its removal results a
disconnected graph.
}
\seealso{
Other flow: 
\code{\link{dominator_tree}()},
\code{\link{edge_connectivity}()},
\code{\link{is_min_separator}()},
\code{\link{max_flow}()},
\code{\link{min_cut}()},
\code{\link{min_separators}()},
\code{\link{min_st_separators}()},
\code{\link{st_cuts}()},
\code{\link{st_min_cuts}()},
\code{\link{vertex_connectivity}()}
}
\concept{flow}
