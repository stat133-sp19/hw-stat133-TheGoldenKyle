#' @title Binomial Mean
#' @description Computes the mean of a binomial distribution
#' @param trials Number of trials (real)
#' @param prob Probability of successs (real)
#' @return Returns the mean
#' @export
#' @examples
#' bin_mean(10, 0.3)
#' 3
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#' @title Binomial Variance
#' @description Computes the variance of a binomial distribution
#' @param trials Number of trials (real)
#' @param prob Probability of successs (real)
#' @return Returns the variance
#' @export
#' @examples
#' bin_variance(10, 0.3)
#' 2.1
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#' @title Binomial Mode
#' @description Computes the mode of a binomial distribution
#' @param trials Number of trials (real)
#' @param prob Probability of successs (real)
#' @return Returns the mode
#' @export
#' @examples
#' bin_mode(10, 0.3)
#' 3
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}

#' @title Binomial Skewness
#' @description Computes the skewness of a binomial distribution
#' @param trials Number of trials (real)
#' @param prob Probability of successs (real)
#' @return Returns the skewness
#' @export
#' @examples
#' bin_skewness(10, 0.3)
#' 0.2760262
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}

#' @title Binomial Kurtosis
#' @description Computes the kurtosis of a binomial distribution
#' @param trials Number of trials (real)
#' @param prob Probability of successs (real)
#' @return Returns the kurtosis
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)
#' -0.1238095
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}
