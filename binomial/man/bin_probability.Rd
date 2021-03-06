% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bin_probability.R
\name{bin_probability}
\alias{bin_probability}
\title{Binomial Probability}
\usage{
bin_probability(success, trials, prob)
}
\arguments{
\item{success}{Vector of successes (numeric)}

\item{trials}{Number of trials (numeric)}

\item{prob}{Probability of successs (real)}
}
\value{
Probability of the number of successes (real)
}
\description{
Returns the probability of having a certain number of successes in a given number of trials, with a given probability of success for each trial.
}
\examples{
bin_probability(success = 2, trials = 5, prob = 0.5)
0.3125

bin_probability(success = 0:2, trials = 5, prob = 0.5)
0.03125 0.15625 0.31250

bin_probability(success = 55, trials = 100, prob = 0.45)
0.01075277

bin_probability(success = 6, trials = 5, prob = 0.5)
'k cannot be larger than n'

bin_probability(success = 0:5 , trials = 5, prob = 0.5)
'success larger than number of trials'

}
