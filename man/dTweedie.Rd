\name{dTweedie}
\alias{dTweedie}
\alias{dTweedie}
\alias{pTweedie}
\alias{rTweedie}
\title{Density, derivatives, distribution function, and random generation for the Tweedie distribution.}
\description{Density, derivatives, distribution function, and random generation for the Tweedie distribution. The distribution is parameterised by the mean, dispersion parameter and the power parameter so that the distribution's variance is given by disperion * mean^power.
}
\usage{
dTweedie( y, mu, phi, p, LOG=TRUE)
pTweedie( q, mu, phi, p)
rTweedie( n, mu, phi, p)
}
\arguments{
\item{ y,q}{vector of quantiles}
\item{ n}{number of random draws}
\item{ mu}{scalar or vector (length matches y or equal to n) of means}
\item{ phi}{scalar or vector (length matches y or equal to n) of dispersion parameters}
\item{ p}{scalar or vector (length matches y or equal to n) of power parameters}
\item{ LOG}{indication of return scale. If TRUE (default) then the density is returned on the log scale.}
}
\details{
The density calculation is based on the series summation method described in Dunn and Smyth (2005). These functions are really just wrappers to the equivalent functions dPoisGam, pPoisGam and rPoisGam. The functions are equivalent up to parameterisation of the distribution.

The distribution function is calculated by adaptive quadrature (a call to the integrate function). However, the point discontinuity at zero is handled explicitly by assuming the convention that the distribution function evaluated at zero is equal to the density at zero.
}
\value{
\item{ dTweedie returns a numeric vector containing the (log-)densities.}{}
\item{ pTweedie returns a numeric vector containing the values of the distribution function.}{}
\item{ rTweedie returns a numeric vector containing the random variables.}{}
}
\references{
Dunn P. K. and Smyth G. K. (2005) Series evaluation of Tweedie exponential dispersion model densities. \emph{Statistics and Computing} \bold{15}: 267-280.

Foster, S.D. and Bravington, M.V. (2013) A Poisson-Gamma Model for Analysis of Ecological Non-Negative Continuous Data. \emph{Journal of Environmental and Ecological Statistics} \bold{20}: 533-552
}
\author{Scott D. Foster}
\examples{
my.seq <- seq( from=0, to=20, length=200)
par( mfrow=c( 1,2))
plot( my.seq, dTweedie( y=my.seq, mu=5, phi=2.1, p=1.6, LOG=FALSE),
 type='l', xlab="Variable", ylab="Density")
plot( my.seq, pTweedie( q=my.seq, mu=5, phi=2.1, p=1.6),
 type='l', xlab="Variable", ylab="Distribution")
}
\keyword{misc}
