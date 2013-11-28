\name{deltaLN}
\alias{deltaLN}
\alias{deltaLN}
\title{Fitting models based on the Delta Log-Normal distribution.}
\description{Fits a compound model that assumes a Delta Log-Normal distribution. The mean of the log-normal process and the mean of the binary process are allowed to change with covariates.
}
\usage{deltaLN( ln.form, binary.form, data, residuals=TRUE)
}
\arguments{
\item{ ln.form}{an object of class "formula" (or one that can be coerced to that class). This is a symbolic representation of the model for the log-normal variable. Note that offset terms (if any) should be included in this part of the model.}
\item{ binary.form}{an object of class "formula" (or one that can be coerced to that class). This is a symbolic representation of the model for the binary variable and should not contain an outcome (e.g. ~1+var1+var2).}
\item{ data}{a data frame, list or environment (or object coercible by as.data.frame to a data frame) containing the variables in the model.}
\item{ residuals}{boolean indicating if the quantile residuals should be calculated. Default is TRUE indicating residuals are to be calculated.}
}
\details{
The observed random variables y_i are assumed to arise from a process that has a non-zero probability that y_i is greater than zero; further, the distribution of y_i conditional on y_i>0 follows a log-normal distribution. This modelling framework models the mean of the conditional distribution and the probability of obtaining a non-zero.

The means of each component of the model are specified in ln.form and binary.form for the log-normal and the zero/non-zero model components respectively. The binary.form formula should not contain an outcome. The binary part of the model is done using a logistic link funciton.

If residuals are requested then two types are returned: Pearson residuals and randomised quantile residuals, described in general by Dunn and Smyth (1996).
}
\value{
\item{ pgm returns an object of class "DeltaLNmod", a list with the following elements}{}
\item{ coef}{the estiamted coefficients from the fitting process. A list with an element for the binary and log-normal parts of the model as well as an element for the standard deviation of the log-normal.}
\item{ logl}{the maximum log likelihood (found at the estimates).}
\item{ AIC}{an Information Criteria.}
\item{ BIC}{Bayesian Information Criteria.}
\item{ fitted}{fitted values of the delta log-normal variable.}
\item{ fitted.var}{variance of the fitted delta log-normal variable.}
\item{ residuals}{a 2-column matrix whose first column contains the randomised quantile residuals and whose second column contains the Pearson residuals.}
\item{ n}{the number of observations used to fit the model.}
\item{ ncovars}{the number of parameters in the combined model.}
\item{ nzero}{the number of non-zero elements.}
\item{ lnMod}{the lm object obtained from fitting the log-normal (non-zero) part of the model.}
\item{ binMod}{the glm object obtained from fitting the zero / non-zero part of the model.}
}
\references{
Aitchison J. (1955) On the Distribution of a Positive Random Variable Having a Discrete Probability Mass at the Origin. \emph{Journal of the American Statistical Association} \bold{50} 901-908.

Dunn P. K and Smyth G. K (1996) Randomized Quantile Residuals. \emph{Journal of Computational and Graphical Statistics} \bold{5}: 236-244.

Foster, S.D. and Bravington, M.V. (2013) A Poisson-Gamma Model for Analysis of Ecological Non-Negative Continuous Data. \emph{Journal of Environmental and Ecological Statistics} \bold{20}: 533-552
}
\author{Scott D. Foster}
\keyword{misc}
