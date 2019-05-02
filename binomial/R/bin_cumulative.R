#' @title Binomial Cumulative
#' @description Computes the binomial distribution of a certain number of success over a given number of trials as well as the cumulative probability up to that number of successes
#' @param trials Number of trials (numeric)
#' @param prob Probability of successs (real)
#' @return Returns a data.frame of the number of successes and their probabilities as well as the cumulative probability up to a certain number of successes
#' @export
#' @examples
#' dis2 <- bin_cumulative(trials = 5, prob = 0.5)
#' dis2
#      success probability cumulative
#' 1       0     0.03125    0.03125
#' 2       1     0.15625    0.18750
#' 3       2     0.31250    0.50000
#' 4       3     0.31250    0.81250
#' 5       4     0.15625    0.96875
#' 6       5     0.03125    1.00000
#'
#' plot(dis2)
#' Returns a plot of the cumulative probability versus number of successess
bin_cumulative <- function(trials, prob) {
    distribution <- bin_distribution(trials, prob)
    probabilities <- distribution$probability
    cumulatives <- c()
    sum <- 0
    for (i in 1:length(probabilities)) {
      sum <- sum + probabilities[i]
      cumulatives <- c(cumulatives, sum)
    }
    distribution$cumulative <- cumulatives
    class(distribution) <- c("bincum", "data.frame")
    distribution
}

#' @export
plot.bincum <- function(distribution) {
  plot(x = distribution$success, y = distribution$cumulative, xlab = "successes", ylab = "probability")
  lines(x = distribution$success, y = distribution$cumulative)
}
