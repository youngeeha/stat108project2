#' Descriptive outcome results for eight strains of mice over time
#'
#' Includes measurements for ID, outcome at three checkpoints, and the date of three checkpoints.
#' This is a subset of \code{\link{data_raw}}.
#'
#' @format A tibble with 32 rows and 7 variables:
#' \describe{
#'   \item{ID}{a factor denoting mouse sex and identification number}
#'   \item{Outcome {i}}{a float denoting the mouse's outcome value at checkpoint {i}}
#'   \item{Date Outcome {i}}{The date on which the outcome was recorded at checkpoint {i}}
#' }
#' @source {Stat 108 Professor James Xenakis https://canvas.harvard.edu/courses/140628/files/folder/Projects?}
"outcome_data"
