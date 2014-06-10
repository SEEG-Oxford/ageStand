\name{invertPF}
\alias{invertPF}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
invertPF(prevalence, sample_weights, age_min, age_max, parameters)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{prevalence}{
%%     ~~Describe \code{prevalence} here~~
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
function (prevalence, sample_weights, age_min, age_max, parameters) 
{
    loss <- function(P_prime, sample_weights, age_min, age_max, 
        prevalence, parameters) {
        PF_Aw <- PFw(P_prime = P_prime, sample_weights = sample_weights, 
            age_min = age_min, age_max = age_max, parameters = parameters)
        squared_error <- (prevalence - PF_Aw)^2
        return(squared_error)
    }
    PF_A <- optimize(f = loss, interval = c(0, 1), sample_weights = sample_weights, 
        age_min = age_min, age_max = age_max, prevalence = prevalence, 
        parameters = parameters)$min
    return(PF_A)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
