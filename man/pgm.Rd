\name{pgm}
\alias{pgm}
\alias{pgm}
\title{Fitting models based on the Poisson-Gamma model.}
\description{Fits a model that assumes a Poisson-Gamma distribution. The mean of the unobserved Poisson variable and the mean of the unobserved Gamma random variables are allowed to change with covariates.
}
\usage{
pgm( p.form, g.form, data, wts=NULL, alpha=NULL, inits=NULL,
  vcov=TRUE, residuals=TRUE, trace=1)
}
\arguments{
\item{ p.form}{an object of class "formula" (or one that can be coerced to that class). This is a symbolic representation of the model for the unobserved Poisson variable. Note that offset terms (if any) should be included in this part of the model.}
\item{ g.form}{an object of class "formula" (or one that can be coerced to that class). This is a symbolic representation of the model for the unobserved Gamma variables. Note that any outcome and offset terms included in this part of the model are ignored.}
\item{ wts}{relative contribution to the log-likelihood contributions. Must be the same length as the number of observations.}
\item{ data}{a data frame, list or environment (or object coercible by as.data.frame to a data frame) containing the variables in the model.}
\item{ alpha}{a positive scalar whose presence indicates that a profile likelihood should be used for estimating all parameters except alpha (set to supllied value).}
\item{ inits}{numeric vector containing the starting values for the coefficient estimates. The ordering of the vector is:coefficients for p.form, coefficients for g.form, and log( alpha), where alpha is the dispersion parameter for the unobserved gamma variables. Defaults to zero for each coefficient.}
\item{ vcov}{boolean indicating if the variance-covariance matrix of the coefficient estimates should be calculated or not. Default is TRUE indicating that it will be calculated.}
\item{ residuals}{boolean indicating if the quantile residuals should be calculated. Default is TRUE indicating residuals are to be calculated.}
\item{ trace}{non-negative integer value indicating how often during estimation the updated coefficients should be calculated. Default is 1, indicating printing at every iteration. A value of 0 indicates that no printing will occur.}
}
\details{
The observed random variables y_i are assumed to arise from the process: y_i=sum(z_\{i1\}+z_\{i2\}+...+z_\{in_i\}) where n_i is a Poisson variable with mean lambda and z_\{ij\} is a Gamma variable with mean mu.Z and variance mu.Z^2 / alpha.

The means of each of the unobserved random variables are modelled using a log-link and the formula given in p.form and g.form.

The distribution is equivalent, up to parameterisation and model interpretation, to the Tweedie GLM model described in Smyth (1996) and Dunn and Smyth (2005). Their models contain model the overall mean only and not the separate processes. Also the Poisson-Gamma distribution is a subset of the more general Tweedie distribution.

The residuals are quantile residuals, described in general by Dunn and Smyth (1996). Calculation of the quantile residuals ignores any specified weights.
}
\value{
\item{ pgm returns an object of class "pgm", a list with the following elements}{}
\item{ coef}{the estiamted coefficients from the fitting process.}
\item{ logl}{the maximum log likelihood (found at the estimates).}
\item{ score}{the score of the log-likelihood (at the estimates).}
\item{ vcov}{the variance-covariance matrix of the estimates. If vcov is FALSE then this will be NULL.}
\item{ conv}{the convergence message from the call to nlminb.}
\item{ message}{the convergence message from nlminb.}
\item{ niter}{the number of iterations taken to obtain convergence.}
\item{ evals}{the number of times the log-likelihood and its derivative were evaluated.}
\item{ call}{the call used to invoke the function.}
\item{ fitted}{matrix with three columns containing:the total modelled mean, the Poisson mean, and the gamma mean.}
\item{ residuals}{the vector of quantile residuals.}
}
\references{
Smyth, G. K. (1996) Regression analysis of quantity data with exact zeros. \emph{Proceedings of the Second Australia--Japan Workshop on Stochastic Models in Engineering, Technology and Management}. Technology Management Centre, University of Queensland, pp. 572-580.

Dunn P. K and Smyth G. K (1996) Randomized Quantile Residuals. \emph{Journal of Computational and Graphical Statistics} \bold{5}: 236-244.

Dunn P. K. and Smyth G. K. (2005) Series evaluation of Tweedie exponential dispersion model densities. \emph{Statistics and Computing} \bold{15}: 267-280.

Foster, S.D. and Bravington, M.V. (2013) A Poisson-Gamma Model for Analysis of Ecological Non-Negative Continuous Data. \emph{Journal of Environmental and Ecological Statistics} \bold{20}: 533-552
}
\author{Scott D. Foster}
\examples{
my.coef <- c(0.6, 1.2, 0, -0.3, 0, -0.5, 0.85)
sim.dat <- simReg( n=250, lambda.tau=my.coef[1:3], mu.Z.tau=my.coef[4:6], alpha=my.coef[7])
fm <- pgm( p.form=y~1+x1+x2, g.form=~1+x1+x2, data=sim.dat)
tmp <- matrix( c( my.coef, fm$coef, sqrt( diag( fm$vcov))), ncol=3)
tmp[nrow( tmp),1] <- log( tmp[nrow( tmp),1])  #putting values on same scale
colnames( tmp) <- c("actual","estiated","SE")
rownames( tmp) <- names( fm$coef)
print( tmp)
}
\keyword{misc}
