\name{fishMod-package}
\alias{fishMod}
\alias{fishMod-package}
\docType{package}
\title{How to use fishMod}
\description{
fishMod is a package that contains some very specific functions for a) fitting extensions of generalised linear models (GLMs) that allow for non-negative observations with exact zeros, and b) targetted fisheries catch and effort data using a (quite complex) mixture model. The package is intended to be used in reasonable anger on real data sets but \emph{it does} have limitations. Primarily, these arise from not nesting the models within the hierarchy of standard R{} functions. This means that there are currently no generic methods, such as `plot' and `summary' for the objects returned by the functions. Instead, the analyst must fish around (excuse the pun) for the bits and peices required for the task at hand, for example residuals and fitted values for diagnostic plots.

The important functions in the fishMod namespace can be arranged into two groups: 1) \code{\link{dPoisGam}}, \code{\link{pPoisGam}}, \code{\link{rPoisGam}}, \code{\link{dPoisGamDerivs}}, \code{\link{dTweedie}}, \code{\link{pTweedie}}, \code{\link{rTweedie}}; and 2) \code{\link{deltaLN}}, \code{\link{pgm}}, \code{\link{tglm}}, \code{\link{tglm.fit}}, \code{\link{simReg}}. These correspond to functions for 1) utility functions for Tweedie densities and Poisson-gamma representations of Tweedies; and 2) extensions of GLMs for non-negative data.

Note that there is an extended version of this package (available from the author but not from CRAN) that also contains functions for multi-species catch and effort data that attempt to account for targetting.
}
\author{Scott D. Foster}
\keyword{misc}
