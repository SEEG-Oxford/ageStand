\name{convertPrevalence}
\alias{convertPrevalence}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
convertPrevalence(prevalence, age_min_in, age_max_in, age_min_out = rep(2, length(prevalence)), age_max_out = rep(9, length(prevalence)), parameters = "Pf_Smith2007", sample_weights = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{prevalence}{
%%     ~~Describe \code{prevalence} here~~
}
  \item{age_min_in}{
%%     ~~Describe \code{age_min_in} here~~
}
  \item{age_max_in}{
%%     ~~Describe \code{age_max_in} here~~
}
  \item{age_min_out}{
%%     ~~Describe \code{age_min_out} here~~
}
  \item{age_max_out}{
%%     ~~Describe \code{age_max_out} here~~
}
  \item{parameters}{
%%     ~~Describe \code{parameters} here~~
}
  \item{sample_weights}{
%%     ~~Describe \code{sample_weights} here~~
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
function (prevalence, age_min_in, age_max_in, age_min_out = rep(2, 
    length(prevalence)), age_max_out = rep(9, length(prevalence)), 
    parameters = "Pf_Smith2007", sample_weights = NULL) 
{
    if (class(parameters) == "character" && length(parameters == 
        1) && parameters \%in\% c("Pf_Smith2007", "Pv_Gething2012")) {
        parameters <- switch(parameters, Pf_Smith2007 = c(b = 1.807675, 
            s = 0.446326, c = 0.070376, alpha = 9.422033), Pv_Gething2012 = c(b = 0.947, 
            s = 0.773, c = 0.208, alpha = 6.66))
    }
    else if (class(parameters) != "numeric" || length(parameters) != 
        4) {
        stop("The argument \"parameters\" must be one of either \"Pf_Smith2007\",\n\"Pv_Gething2012\" or a numeric vector of length 4 giving the values of parameters\nb, s, c and alpha (in that order!)")
    }
    if (is.null(sample_weights)) {
        sample_weights <- c(0.03916203, 0.04464933, 0.0464907, 
            0.04703639, 0.04468962, 0.04430289, 0.04088593, 0.04048751, 
            0.0385978, 0.03586601, 0.03665516, 0.02850493, 0.03038655, 
            0.02493861, 0.02169105, 0.0150684, 0.01481482, 0.01519726, 
            0.01474023, 0.01553814, 0.01193805, 0.01220409, 0.01202119, 
            0.01202534, 0.01283806, 0.01083728, 0.01095784, 0.01092874, 
            0.01067932, 0.01137331, 0.01035001, 0.01035001, 0.01035001, 
            0.01035001, 0.01035001, 0.008342426, 0.008342426, 
            0.008342426, 0.008342426, 0.008342426, 0.00660059, 
            0.00660059, 0.00660059, 0.00660059, 0.00660059, 0.004597861, 
            0.004597861, 0.004597861, 0.004597861, 0.004597861, 
            0.003960774, 0.003960774, 0.003960774, 0.003960774, 
            0.003960774, 0.003045687, 0.003045687, 0.003045687, 
            0.003045687, 0.003045687, 0.002761077, 0.002761077, 
            0.002761077, 0.002761077, 0.002761077, 0.001275367, 
            0.001275367, 0.001275367, 0.001275367, 0.001275367, 
            0.001275367, 0.001275367, 0.001275367, 0.001275367, 
            0.001275367, 0.001275367, 0.001275367, 0.001275367, 
            0.001275367, 0.001275367, 0.001275367, 0.001275367, 
            0.001275367, 0.001275367, 0.001275367)
    }
    N <- length(prevalence)
    stopifnot(length(age_min_in) == length(prevalence))
    stopifnot(length(age_max_in) == length(prevalence))
    stopifnot(length(age_min_out) == length(prevalence))
    stopifnot(length(age_max_out) == length(prevalence))
    age_min_in <- pmin(age_min_in, 85)
    age_max_in <- pmin(age_max_in, 85)
    age_min_out <- pmin(age_min_out, 85)
    age_max_out <- pmin(age_max_out, 85)
    stopifnot(age_min_out >= 0)
    stopifnot(age_max_out >= 0)
    stopifnot(age_min_out < age_max_out)
    if (N > 1) {
        ans <- vector(mode = "numeric", length = N)
        for (i in 1:N) {
            ans[i] <- convertPrevalence(prevalence = prevalence[i], 
                age_min_in = age_min_in[i], age_max_in = age_max_in[i], 
                age_min_out = age_min_out[i], age_max_out = age_max_out[i], 
                parameters = parameters, sample_weights = sample_weights)
        }
        return(ans)
    }
    P_prime <- invertPF(prevalence = prevalence, age_min = age_min_in, 
        age_max = age_max_in, sample_weights = sample_weights, 
        parameters = parameters)
    ans <- PFw(P_prime, age_min = age_min_out, age_max = age_max_out, 
        sample_weights = sample_weights, parameters = parameters)
    return(ans)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
