\name{convertPrevalence}
\alias{convertPrevalence}

\title{
Convert parasite rate estimates between age categories.
}

\description{
Given a malaria parasite rate for a specific age category, used the modified Pull and Grab model introduced by Smith \emph{et al.} (2007) to estimate the parasite rate for any other age category. 
}

\usage{
convertPrevalence(prevalence,
                  age_min_in,
                  age_max_in,
                  age_min_out = rep(2, length(prevalence)),
                  age_max_out = rep(9, length(prevalence)),
                  parameters = "Pf_Smith2007",
                  sample_weights = NULL)
}

\arguments{
  \item{prevalence}{
  A vector giving the malaria prevalence (parasite rate) estimates to convert from.
}
  \item{age_min_in}{
  A vector giving the (exclusive) lower bound on the age range associated with the prevalence estimates given in \emph{prevalence}.
}
  \item{age_max_in}{
  A vector giving the (inclusive) upper bound on the age range associated with the prevalence estimates given in \emph{prevalence}.
}
  \item{age_min_out}{
  A vector giving the (exclusive) lower bound on the age range for which the resulting prevalence estimate is to be calculated. Defaults to 2 for all elements of \emph{prevalence}, i.e. ages *above* 2.
}
  \item{age_max_out}{
  A vector giving the (inclusive) upper bound on the age range for which the resulting prevalence estimate is to be calculated. Defaults to 9 for all elements of \emph{prevalence}, i.e. ages 9 and below.
}
  \item{parameters}{
  The set of parameters to use in the model. This can either be "Pf_Smith2007" to use the parameters for \emph{Plasmodium falciparum} defined in Smith \emph{et al.} (2007), "Pv_Gething2012" for the \emph{P. vivax} parameters used in Gething \emph{et al.} (2012), or a user-specified vector givng the values of parameters \eqn{b}, \eqn{s}, \eqn{c} and \eqn{\alpha}, in that order.
}
  \item{sample_weights}{
  If specified, `sample_weights` must be a vector of length 85 giving the age distribution of the population (i.e. the proportion of the population with age falling within 85 1-year bins: 0-1, 1-2, ..., 83-84, 84-85+). If \code{sample_weights = NULL} the average age distribution given in the studies used in Smith {et al.} (2007) are used.
}
}

\details{
The vectors \code{prevalence}, \code{age_min_in}, \code{age_max_in}, \code{age_min_out} and \code{age_max_out} must all have the same length.

See Smith \emph{et al.} (2007) for details of the model used.
}

\value{
  A vector of the same length as \code{prevalence} with each element giving the parasite rate estimates for the age range bounded by the corresponding elements of \code{age_min_out} and \code{age_max_out}.
}

\references{
Smith, D. L. \emph{et al.} Standardizing estimates of the Plasmodium falciparum parasite rate. \emph{Malar. J.} 6, 131 (2007).

Gething, P. W. \emph{et al.} A long neglected world malaria map: \emph{Plasmodium vivax} endemicity in 2010. \emph{PLoS Negl. Trop. Dis.} 6, e1814 (2012).
}

\author{
David L. Smith and Nick Golding
}

\examples{
# convert a 2-10 PfPR of 0.1 to all-ages prevalence using the
# parameters for PfPR from Smith *et al.* (2007) - the default.
convertPrevalence(prevalence = 0.1,
                  age_min_in = 2,
                  age_max_in = 9,
                  age_min_out = 0,
                  age_max_out = 85)

# convert a 2-10 *PvPR* of 0.3 to 60-85 prevalence using the
# parameters for PvPR from Gething *et al.* (2012)
convertPrevalence(prevalence = 0.3,
                  age_min_in = 2,
                  age_max_in = 9,
                  age_min_out = 60,
                  age_max_out = 85,
                  parameters = "Pv_Gething2012")

# The same again, but using a user-specified set of parameters
convertPrevalence(prevalence = 0.3,
                  age_min_in = 2,
                  age_max_in = 9,
                  age_min_out = 60,
                  age_max_out = 85,
                  parameters = c(b = 1.2,
                                 s = 0.8,
                                 c = 0.1,
                                 alpha = 5.1))

# The function is vectorized, so convert a whole load of PvPRs with different
# age ranges to 2-10 PvPR (the default) using the Gething *et al.* (2013)
# parameters
convertPrevalence(prevalence = (1:5) / 10,
                  age_min_in = 1:5,
                  age_max_in = (1:5) * 10,
                  parameters = "Pv_Gething2012")
}