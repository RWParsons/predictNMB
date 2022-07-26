#' Evaluates a cutpoint by returning the mean NMB per sample.
#'
#' @param predicted A vector of predicted probabilities.
#' @param actual A vector of actual outcomes.
#' @param pt The probability threshold to be evaluated.
#' @param nmb A named vector containing NMB assigned to each classification.
#'
#' @return Returns a \code{numeric} value representing the NMB for that
#' cutpoint and data.
#' @export
#'
#' @examples
#' evaluate_cutpoint(
#'   predicted = runif(1000),
#'   actual = sample(c(0, 1), size = 1000, replace = TRUE),
#'   pt = 0.1,
#'   nmb = c("TP" = -3, "TN" = 0, "FP" = -1, "FN" = -4)
#' )
evaluate_cutpoint <- function(predicted, actual, pt, nmb) {
  d <- cbind(predicted, actual, NA)
  colnames(d) <- c("predicted", "actual", "nmb")

  d[d[, "predicted"] < pt & d[, "actual"] == 0, "nmb"] <- nmb["TN"]
  d[d[, "predicted"] < pt & d[, "actual"] == 1, "nmb"] <- nmb["FN"]
  d[d[, "predicted"] > pt & d[, "actual"] == 1, "nmb"] <- nmb["TP"]
  d[d[, "predicted"] > pt & d[, "actual"] == 0, "nmb"] <- nmb["FP"]

  mean(d[, "nmb"])
}
