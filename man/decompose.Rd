% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/components.R
\name{decompose}
\alias{decompose}
\title{Decompose a graph into components}
\usage{
decompose(graph, mode = c("weak", "strong"), max.comps = NA, min.vertices = 0)
}
\arguments{
\item{graph}{The original graph.}

\item{mode}{Character constant giving the type of the components, wither
\code{weak} for weakly connected components or \code{strong} for strongly
connected components.}

\item{max.comps}{The maximum number of components to return. The first
\code{max.comps} components will be returned (which hold at least
\code{min.vertices} vertices, see the next parameter), the others will be
ignored. Supply \code{NA} here if you don't want to limit the number of
components.}

\item{min.vertices}{The minimum number of vertices a component should
contain in order to place it in the result list. E.g. supply 2 here to ignore
isolate vertices.}
}
\value{
A list of graph objects.
}
\description{
Creates a separate graph for each connected component of a graph.
}
\examples{

# the diameter of each component in a random graph
g <- sample_gnp(1000, 1 / 1000)
components <- decompose(g, min.vertices = 2)
sapply(components, diameter)

}
\seealso{
\code{\link[=is_connected]{is_connected()}} to decide whether a graph is connected,
\code{\link[=components]{components()}} to calculate the connected components of a graph.

Connected components
\code{\link{articulation_points}()},
\code{\link{biconnected_components}()},
\code{\link{component_distribution}()},
\code{\link{is_biconnected}()}
}
\author{
Gabor Csardi \email{csardi.gabor@gmail.com}
}
\concept{components}
\keyword{graphs}
