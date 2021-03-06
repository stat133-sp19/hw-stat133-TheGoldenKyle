% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary_measures.R
\name{bin_skewness}
\alias{bin_skewness}
\title{Binomial Skewness}
\usage{
bin_skewness(trials, prob)
}
\arguments{
\item{trials}{Number of trials (real)}

\item{prob}{Probability of successs (real)}
}
\value{
Returns the skewness
}
\description{
Computes the skewness of a binomial distribution
}
\examples{
bin_skewness(10, 0.3)
0.2760262
}
