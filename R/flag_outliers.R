#' Flag Outliers in Body Weight Measurements
#'
#' @param data  A data frame containing body weight measurements across different weeks (default is merged_data)
#' @param weight_cols A vector of column names for the body weight measurements (default is included)
#' @param threshold The multiplier for the IQR to define outliers (default is 1.5).
#'
#' @return A data frame with additional columns indicating whether each weight is an outlier.
#' @export
#'
#' @examples
#' flag_outliers(bodyweight_data, weight_cols = c("Body_Weight_1", "Body_Weight_2", "Body_Weight_3"))
#'
flag_outliers <- function(data = merged_data, weight_cols = c("Body_Weight_1", "Body_Weight_2", "Body_Weight_3"),
                          threshold = 1.5) {
  # Loop through each weight column to flag outliers
  for (col in weight_cols) {
    # Calculate Q1, Q3, and IQR
    Q1 <- quantile(data[[col]], 0.25, na.rm = TRUE)
    Q3 <- quantile(data[[col]], 0.75, na.rm = TRUE)
    IQR_value <- Q3 - Q1

    # Define outlier thresholds
    lower_bound <- Q1 - threshold * IQR_value
    upper_bound <- Q3 + threshold * IQR_value

    # Create a new column to flag outliers
    outlier_col <- paste0(col, "_Outlier")
    data[[outlier_col]] <- ifelse(data[[col]] < lower_bound | data[[col]] > upper_bound, TRUE, FALSE)
  }

  return(data)
}
