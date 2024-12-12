#' Descriptive measurements of bodyweight for eight strains of mice over time
#'
#' Includes measurements for treatment, sex, multiple body weight checkpoints, and multiple outcome checkpoints.
#' This is a subset of \code{\link{data_raw}}.
#'
#' @format A tibble with 32 rows and 8 variables:
#' \describe{
#'   \item{ID}{a factor denoting mouse sex and identification number}
#'   \item{Body Weight {i}}{a float denoting the mouse's body weight at checkpoint {i}}
#'   \item{Date Body Weight {i}}{The date on which the body weight was recorded at checkpoint {i}}
#' }
#' @source {Stat 108 Professor James Xenakis https://canvas.harvard.edu/courses/140628/files/folder/Projects?}
"bodyweight_data"
