% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary_measures.R
\name{bin_mode}
\alias{bin_mode}
\title{Binomial Mode}
\usage{
bin_mode(trials, prob)
}
\arguments{
\item{trials}{Number of trials (real)}

\item{prob}{Probability of successs (real)}
}
\value{
Returns the mode
}
\description{
Computes the mode of a binomial distribution
}
\examples{
bin_mode(10, 0.3)
3
}
