#' @title Binomial Variable
#' @description An object which represents a binomial random variable
#' @param trials Number of trials (numeric)
#' @param prob Probability of successs (real)
#' @return Binomial Random Variable object
#' @export
#' @examples
#' bin1 <- bin_variable(trials = 10, p = 0.3)
#' bin1
#' "Binomial variable"
#' Paramaters
#' Number of Trials: 10
#' Probability of Success : 0.3
#'
#' binsum1 <- summary(bin1)
#' binsum1
#'
#' "Summary Binomial"
#' Parameters
#' Number of Trials: 10
#' Probability of Successs : 0.3
#' Measures
#' Mean : 3
#' Variance: 2.1
#' Mode: 3
#' Skewness: 0.2760262
#' Kurtosis: -0.1238095
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  object <- list(trials = trials, prob = prob)
  class(object) <- "binvar"
  object
}

#' @export
print.binvar <- function(object) {
  print("Binomial Variable")
  print("")
  print("Parameters")
  print(paste0("Number of trials: ", object[[1]]))
  print(paste0("Probability of Success: ", object[[2]]))
}


#' @export
summary.binvar <- function(binvar) {
  num_trials = binvar[[1]]
  probability = binvar[[2]]
  object <- list(trials = num_trials,
                 prob = probability,
                 mean = aux_mean(num_trials, probability),
                 variance = aux_variance(num_trials, probability),
                 mode = aux_mode(num_trials, probability),
                 skewness = aux_skewness(num_trials, probability),
                 kurtosis = aux_kurtosis(num_trials, probability))
  class(object) <- "summary.binvar"
  object
}

#' @export
print.summary.binvar <- function(summary) {
  print("Summary Binomial")
  print("")
  print("Parameters")
  print(paste0("Number of trials: ", summary[['trials']]))
  print(paste0("Probability of Success: ", summary[['prob']]))
  print("")
  print("Measures")
  print(paste0("Mean: ", summary[['mean']]))
  print(paste0("Variance: ", summary[['variance']]))
  print(paste0("Mode: ", summary[['mode']]))
  print(paste0("Skewness: ", summary[['skewness']]))
  print(paste0("Kurtosis: ", summary[['kurtosis']]))
}
