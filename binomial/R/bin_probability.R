#' @title Binomial Probability
#' @description Returns the probability of having a certain number of successes in a given number of trials, with a given probability of success for each trial.
#' @param success Vector of successes (numeric)
#' @param trials Number of trials (numeric)
#' @param prob Probability of successs (real)
#' @return Probability of the number of successes (real)
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' 0.3125
#'
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' 0.03125 0.15625 0.31250
#'
#' bin_probability(success = 55, trials = 100, prob = 0.45)
#' 0.01075277
#'
#' bin_probability(success = 6, trials = 5, prob = 0.5)
#' 'k cannot be larger than n'
#'
#' bin_probability(success = 0:5 , trials = 5, prob = 0.5)
#' 'success larger than number of trials'
#'
bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  return(bin_choose(trials, success) * (prob ^ success) * ((1-prob) ^ (trials-success)))
}
