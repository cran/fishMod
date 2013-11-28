\name{dPoisGam}
\alias{dPoisGam}
\alias{dPoisGam}
\alias{dPoisGamDerivs}
\alias{pPoisGam}
\alias{rPoisGam}
\title{Density, derivatives, distribution function, and random generation for the Poisson-Gamma distribution.}
\description{Density, derivatives, distribution function, and random generation for the Poisson-Gamma distribution. The distribution is parameterised by the Poisson mean, the Gamma mean and the Gamma dispersion parameter. Derivatives are with respect to these three parameters.
}
\usage{
dPoisGam( y, lambda, mu.Z, alpha, LOG=TRUE)
dPoisGamDerivs( y, lambda, mu.Z, alpha, do.checks=TRUE)
pPoisGam( q, lambda, mu.Z, alpha)
rPoisGam( n, lambda, mu.Z, alpha)
}
\arguments{
\item{ y,q}{vector of quantiles}
\item{ n}{number of random draws}
\item{ lambda}{scalar or vector (length matches y or equal to n) of Poisson means}
\item{ mu.Z}{scalar or vector (length matches y or equal to n) of Gamma means}
\item{ alpha}{scalar or vector (length matches y or equal to n) of Gamma dispersions}
\item{ LOG}{indication of return scale. If TRUE (default) then the density is returned on the log scale.}
\item{ do.checks}{boolean indicating if checks on arguments should be performed. If TRUE (default) then checks will be performed.}
}
\details{
The observed random variables y_i are assumed to arise from the process: y_i=sum(z_\{i1\}+z_\{i2\}+...+z_\{in_i\}) where n_i is a Poisson variable with mean lambda and z_\{ij\} is a Gamma variable with mean mu.Z and variance mu.Z^2 / alpha.

The density calculation is based on the series summation method described in Dunn and Smyth (2005). However, the parameterisation used here is different and follows that described in Section 2 of Smyth (1996). The details of density calculation are subsequently different from Dunn and Smyth (2005).

The derivatives are calculated in a similar manner to the density. The derivatives are for the log-density.
}
\value{
\item{ dPoisGam returns a numeric vector containing the (log-)densities.}{}
\item{ dPoisGamDeriv returns a matrix with three columns, one for each of the distributional parameters.}{}
\item{ pPoisGam returns a numeric vector containing the values of the distribution function.}{}
\item{ rPoisGam returns a numeric vector containing the random variables.}{}
}
\references{
Smyth, G. K. (1996) Regression analysis of quantity data with exact zeros. \emph{Proceedings of the Second Australia--Japan Workshop on Stochastic Models in Engineering, Technology and Management}. Technology Management Centre, University of Queensland, pp. 572-580.

Dunn P. K. and Smyth G. K. (2005) Series evaluation of Tweedie exponential dispersion model densities. \emph{Statistics and Computing} \bold{15}: 267-280.

Foster, S.D. and Bravington, M.V. (2013) A Poisson-Gamma Model for Analysis of Ecological Non-Negative Continuous Data. \emph{Journal of Environmental and Ecological Statistics} \bold{20}: 533-552
}
\author{Scott D. Foster}
\examples{
my.seq <- seq( from=0, to=20, length=200)
par( mfrow=c( 1,2))
plot( my.seq, dPoisGam( y=my.seq, lambda=8, mu.Z=1.2, alpha=0.6, LOG=FALSE), type='l',
 xlab="Variable", ylab="Density")
plot( my.seq, pPoisGam( q=my.seq, lambda=8, mu.Z=1.2, alpha=0.6), type='l',
 xlab="Variable", ylab="Distribution")
}
\keyword{misc}
