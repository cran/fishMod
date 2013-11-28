\name{simReg}
\alias{simReg}
\alias{simReg}
\title{Simulate Poisson-Gamma data whose component means vary with covariates.}
\description{\code{simReg} is used to simulate data from a combined model for the Poisson and Gamma components of a Poisson-Gamma distribution. This formuation allows the distribution to vary with covariates.
}
\usage{simReg( n, lambda.tau, mu.Z.tau, alpha, offset1=NULL, X=NULL)
}
\arguments{
\item{ n}{number of observations}
\item{ lambda.tau}{vector of coefficients for Poisson part of model.}
\item{ mu.Z.tau}{vector of coefficients for Gamma component of model. Its length must be equal to the length of lambda.tau.}
\item{ alpha}{scalar for Gamma dispersion.}
\item{ offset1}{vector of offset values (for Poisson part of the process). If NULL (default) a vector of zeros is created and used.}
\item{ X}{a design matrix with appropriate elements for simulation. If NULL (default) then one will be created.}
}
\details{
The observed random variables y_i are assumed to arise from the process: y_i=sum(z_\{i1\}+z_\{i2\}+...+z_\{in_i\}) where n_i is a Poisson variable with mean lambda and z_\{ij\} is a Gamma variable with mean mu.Z and variance mu.Z^2 / alpha.

The Poisson mean is given by lambda=exp( X \%*\% lambda.tau) where X is a suitable design matrix whose first column is full of 1s and whose remain columns are random draws from a standard normal.

The Gamma mean is given by mu.Z=exp( X \%*\% mu.Z.tau) where X is identical to before.
}
\value{\item{ A data frame containing the random draws, the offset (if not NULL), and the covariates. The data frame has an attribute called "coef" that lists the values used for the simulation.}{}
}
\references{Foster, S.D. and Bravington, M.V. (2013) A Poisson-Gamma Model for Analysis of Ecological Non-Negative Continuous Data. \emph{Journal of Environmental and Ecological Statistics} \bold{20}: 533-552
}
\author{Scott D. Foster}
\examples{
sim.dat <- simReg( n=250, lambda.tau=c(0.6, 1.2, 0), mu.Z.tau=c(-0.3, 0, -0.5), alpha=0.85, X=NULL)
print( head( sim.dat))
}
\keyword{misc}
