#' @title Binomial Choose
#' @description Calculates number of combinations in which k successes can occur in n trials.
#' @param n Number of trials (numeric)
#' @param k Number of successes (numeric)
#' @return Number of combinations (numeric)
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' 10
#'
#' bin_choose(5, 0)
#' 1
#'
#' bin_choose(5, 1:3)
#' 5 10 10
#'
#' bin_choose(5, 6)
#' 'k cannot be larger than n'
#'
#' bin_choose(5, 1:6)
#' 'k cannot be larger than n'
bin_choose <- function(n, k) {
  if (max(k) > n) {
    stop("k cannot be larger than n")
  }
  return(factorial(n) / (factorial(k) * factorial(n-k)))
}
