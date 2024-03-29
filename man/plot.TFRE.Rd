% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Functions.R
\name{plot.TFRE}
\alias{plot.TFRE}
\title{Plot the second stage model curve for a 'TFRE' object}
\usage{
\method{plot}{TFRE}(x, ...)
}
\arguments{
\item{x}{A fitted "TFRE" model object. It should contain a second stage model.}

\item{...}{Not used. Other arguments to be passed through plotting functions.}
}
\value{
No return value, called for side effects.
}
\description{
Plot the HBIC curve and the model size curve as a function of the 
\code{eta} values used, from a fitted TFRE SCAD or MCP model.
}
\details{
In the output plot, the red line represents the HBIC curve as a function
of \code{eta} values, the blue line represents the number of nonzero coefficients
as a function of  \code{eta} values, and the purple vertical dashed line denotes
the model selected with the smallest HBIC.\cr
This function cannot plot the object if \code{object$second_stage = "none"}.
}
\examples{
n <- 20; p <- 50
beta0 <- c(1.5,-1.25,1,-0.75,0.5,rep(0,p-5))
eta_list <- 0.1*6:15*sqrt(log(p)/n)
X <- matrix(rnorm(n*p),n)
y <- X \%*\% beta0 + rt(n,4)
 
Obj_TFRE_SCAD <- TFRE(X, y, eta_list = eta_list, const_incomplete = 5)
plot(Obj_TFRE_SCAD)

\donttest{
Obj_TFRE_MCP <- TFRE(X, y, second_stage = "mcp", eta_list = eta_list, const_incomplete = 5)
plot(Obj_TFRE_MCP)}

}
\references{
Wang, L., Peng, B., Bradic, J., Li, R. and Wu, Y. (2020),
\emph{A Tuning-free Robust and Efficient Approach to High-dimensional Regression,
Journal of the American Statistical Association, 115:532, 1700-1714},
\doi{10.1080/01621459.2020.1840989}.
}
\seealso{
\code{\link{TFRE}}, \code{\link{predict.TFRE}}, \code{\link{coef.TFRE}}
}
\author{
Yunan Wu and Lan Wang\cr Maintainer:
Yunan Wu <yunan.wu@utdallas.edu>
}
