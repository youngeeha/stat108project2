#' Descriptive measurements for eight strains of mice and their outcome over time
#'
#' Includes measurements for treatment, sex, and identification, outcome, and bodyweight changes at each checkpoint.
#' This is a subset of \code{\link{data_raw}}.
#'
#' @format A tibble with 29 rows and 17 variables:
#' \describe{
#'   \item{ID}{a factor denoting mouse sex and identification number}
#'   \item{Treatment}{a factor denoting the treatment received (Placebo, Treatment)}
#'   \item{sex}{a factor denoting mouse sex (female, male)}
#'   \item{Num}{an integer corresponding to the identification number}
#'   \item{Body Weight {i}}{a float denoting the mouse's body weight at checkpoint {i}}
#'   \item{Date Body Weight {i}}{The date on which the body weight was recorded at checkpoint {i}}
#'   \item{Outcome {i}}{a float denoting the mouse's outcome value at checkpoint {i}}
#'   \item{Date Outcome {i}}{The date on which the outcome was recorded at checkpoint {i}}
#' }
#' @source {Stat 108 Professor James Xenakis https://canvas.harvard.edu/courses/140628/files/folder/Projects?}
"merged_data"
