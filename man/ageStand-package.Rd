\name{ageStand-package}
\alias{ageStand-package}
\alias{ageStand}
\docType{package}

\title{
Age standardisation of malaria prevalence
}

\description{
Functions to convert malaria parasite rate estimates between age ranges.
At present this package has only one function \code{\link{convertPrevalence}} which uses the modified Pull and Grab model introduced in Smith \emph{et al.} (2007) to convert prevalence estimates for \emph{Plasmodium falciparum} and \emph{P. vivax}.
}

\details{
\tabular{ll}{
Package: \tab ageStand\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-06-10\cr
License: \tab GPL (>=2)\cr
}
See the helpfile for \code{\link{convertPrevalence}} for details of how to use the currently implemented models
}

\author{
David L. Smith (derived and parameterised the models and wrote the original code)
Nick Golding (restructured the code and wrote the R package)

Maintainer: Nick Golding <nick.golding@zoo.ox.ac.uk>
}

\references{
Smith, D. L. \emph{et al.} Standardizing estimates of the Plasmodium falciparum parasite rate. \emph{Malar. J.} 6, 131 (2007).
}

\seealso{
\code{\link{convertPrevalence}}
}

