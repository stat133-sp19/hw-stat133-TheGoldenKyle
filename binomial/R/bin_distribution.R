#' @title Binomial Distribution
#' @description Computes the binomial distribution of a certain number of success over a given number of trials
#' @param trials Number of trials (numeric)
#' @param prob Probability of successs (real)
#' @return Returns a data.frame of the number of successes and their probabilities
#' @export
#' @examples
#' x <- bin_distribution(trials = 5, prob = 0.5)
#' x
#' success probability
#' 1 0 0.03125
#' 2 1 0.15625
#' 3 2 0.31250
#' 4 3 0.31250
#' 5 4 0.15625
#' 6 5 0.03125
#'
#' plot(x)
#' Returns a barplot of the distribution
#'
bin_distribution <- function(trials, prob) {
  probabilities <- c()
  for (i in 0:trials) {
    probabilities <- c(probabilities, bin_probability(i, trials, prob))
  }
  object <- data.frame(success = 0:trials, probability = probabilities)
  class(object) <- c("bindis", "data.frame")
  object
}

#' @export
plot.bindis <- function(distribution) {
  barplot(distribution$prob, names.arg = distribution$success,  xlab = "successes", ylab = "probability")
}
