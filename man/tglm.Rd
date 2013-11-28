\name{tglm}
\alias{tglm}
\alias{tglm}
\alias{tglm.fit}
\title{Fits a Tweedie GLM via maximum likelihood.}
\description{Fits a log-link Tweedie GLM model using maximum likelihood for all parameters, if wanted. The dispersion and power parameters (phi and p) can be set if required.
}
\usage{
tglm( mean.form, data, wts=NULL, phi=NULL, p=NULL, inits=NULL, vcov=TRUE,
 residuals=TRUE, trace=1, iter.max=150)
tglm.fit( x, y, wts=NULL, offset=rep( 0, length( y)), inits=rnorm( ncol( x)),
  phi=NULL, p=NULL, vcov=TRUE, residuals=TRUE, trace=1, iter.max=150)
}
\arguments{
\item{ mean.form}{an object of class "formula" (or one that can be coerced to that class). This is a symbolic representation of the model for the mean of the observations. Offset terms can be included in this formula.}
\item{ data}{a data frame, list or environment (or object coercible by as.data.frame to a data frame) containing the variables in the model.}
\item{ wts}{relative contribution to the log-likelihood contributions. Must be the same length as the number of observations.}
\item{ phi}{a positive scalar whose presence indicates that a profile likelihood should be used for estimating all parameters except the dispersion phi (set to the supllied value).}
\item{ p}{a value in the interval [1,2] whose presence indicates that a profile likelihood should be used for estimating all parameters except the power parameter p (set to the supplied value).}
\item{ inits}{(tglm) numeric vector containing the starting values for the coefficient estimates. The ordering of the vector is:coefficients for mean.form, phi and p. Defaults to zero for each the mean coefficients, 1 for phi, and 1.6 for p. (tglm.fit) numeric vector that must be specified (no default). It has length equal to the number of covariates plus 2.}
\item{ vcov}{boolean indicating if the variance-covariance matrix of the coefficient estimates should be calculated or not. Default is TRUE indicating that it will be calculated.}
\item{ residuals}{boolean indicating if the quantile residuals should be calculated. Default is TRUE indicating residuals are to be calculated.}
\item{ trace}{non-negative integer value indicating how often during estimation the updated coefficients should be calculated. Default is 1, indicating printing at every iteration. A value of 0 indicates that no printing will occur.}
\item{ iter.max}{the maximum number of iterations allowed.}
\item{ x, y, offset}{x is a design matrix, y is the vector of outcomes and offset are the offset values. None of these values are checked. The design matrix has dimension pXn where p is the number of covariates and n is the number of observations.}
}
\details{
The means of each of the unobserved random variables are modelled using a log-link and the formula given in mean.form. This function implements the model described in Smyth (1996) and Dunn and Smyth (2005) but does so by maximising the complete likelihood (ala Dunn and Smyth, 2005). The model specification is restricted to the log link.

The residuals are quantile residuals, described in general by Dunn and Smyth (1996).

tglm.fit is the workhorse function: it is not normally called directly but can be more efficient where the response vector and design matrix have already been calculated. Completely analgous to the function glm.fit.
}
\value{
tglm returns an object of class "tglm", a list with the following elements
\item{ coef}{the estiamted coefficients from the fitting process.}
\item{ logl}{the maximum log likelihood (found at the estimates).}
\item{ score}{the score of the log-likelihood (at the estimates).}
\item{ vcov}{the variance-covariance matrix of the estimates. If vcov is FALSE then this will be NULL.}
\item{ conv}{the convergence message from the call to nlminb.}
\item{ message}{the convergence message from nlminb.}
\item{ niter}{the number of iterations taken to obtain convergence.}
\item{ evals}{the number of times the log-likelihood and its derivative were evaluated.}
\item{ call}{the call used to invoke the function.}
\item{ fitted}{matrix with one column containing the modelled mean.}
\item{ residuals}{the vector of quantile residuals.}
}
\references{
Smyth, G. K. (1996) Regression analysis of quantity data with exact zeros. \emph{Proceedings of the Second Australia--Japan Workshop on Stochastic Models in Engineering, Technology and Management}. Technology Management Centre, University of Queensland, pp. 572-580.

Dunn P. K and Smyth G. K (1996) Randomized Quantile Residuals. \emph{Journal of Computational and Graphical Statistics} \bold{5}: 236-244.

Dunn P. K. and Smyth G. K. (2005) Series evaluation of Tweedie exponential dispersion model densities. \emph{Statistics and Computing} \bold{15}: 267-280.
}
\author{Scott D. Foster}
\examples{
##not a great example
#my.coef <- c(0.6, 1.2, 0, -0.3, 0, -0.5, 0.85)
#sim.dat <- simReg( n=250, lambda.tau=my.coef[1:3], mu.Z.tau=my.coef[4:6], alpha=my.coef[7])
#fm <- tglm( mean.form=y~1+x1+x2, data=sim.dat)
#tmp <- matrix( c( my.coef[1:3] + my.coef[4:6], NA, (2+0.85)/(1+0.85), fm$coef), ncol=2)
#colnames( tmp) <- c("actual","estimated")
#rownames( tmp) <- c( names( fm$coef)[1:3], "phi", "p")
#print( tmp)
#print( "Data generated using Poisson-sum-of-gammas model and fitted using a Tweedie GLM.)
#print( "A great fit is not expected -- especially for the first covariate")
}
\keyword{misc}
