% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/embedding.R
\name{sample_dirichlet}
\alias{sample_dirichlet}
\title{Sample from a Dirichlet distribution}
\usage{
sample_dirichlet(n, alpha)
}
\arguments{
\item{n}{Integer scalar, the sample size.}

\item{alpha}{Numeric vector, the vector of \eqn{\alpha}{alpha} parameter for
the Dirichlet distribution.}
}
\value{
A \code{dim} (length of the \code{alpha} vector for
\code{sample_dirichlet()}) times \code{n} matrix, whose columns are the sample
vectors.
}
\description{
Sample finite-dimensional vectors to use as latent position vectors in
random dot product graphs
}
\details{
\code{sample_dirichlet()} generates samples from the Dirichlet distribution
with given \eqn{\alpha}{alpha} parameter. The sample is drawn from
\code{length(alpha)-1}-simplex.
}
\examples{
lpvs.dir <- sample_dirichlet(n = 20, alpha = rep(1, 10))
RDP.graph.2 <- sample_dot_product(lpvs.dir)
colSums(lpvs.dir)
}
\seealso{
Other latent position vector samplers: 
\code{\link{sample_sphere_surface}()},
\code{\link{sample_sphere_volume}()}
}
\concept{latent position vector samplers}
