\name{PFw}
\alias{PFw}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
PFw(P_prime, sample_weights, age_min = 1, age_max = 85, parameters)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{P_prime}{
%%     ~~Describe \code{P_prime} here~~
}
  \item{sample_weights}{
%%     ~~Describe \code{sample_weights} here~~
}
  \item{age_min}{
%%     ~~Describe \code{age_min} here~~
}
  \item{age_max}{
%%     ~~Describe \code{age_max} here~~
}
  \item{parameters}{
%%     ~~Describe \code{parameters} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (P_prime, sample_weights, age_min = 1, age_max = 85, 
    parameters) 
{
    stopifnot(age_min >= 0 && age_min <= 85)
    stopifnot(age_max >= 0 && age_max <= 85)
    stopifnot(age_min < age_max)
    age <- (age_min:(age_max - 1)) + 0.5
    P <- PF(age, P_prime, parameters)
    idx <- ceiling(age)
    stopifnot(max(idx) <= length(sample_weights))
    PF_Aw <- weighted.mean(P, sample_weights[idx])
    return(PF_Aw)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
