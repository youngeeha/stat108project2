# Summary statistics for body weights
#' Bodyweight_Summary
#'
#'This function highlights summaries of bodyweight data.

#' @param merged_data A dataframe that contains sex, treatment, bodyweight, and id info
#'
#' @return A table containing summary information on Bodyweights at each checkpoint
#' @export
#'
bodyweight_summary <- function(merged_data) {
  summary_table <- data.frame(
    Body_Weight_1_Avg = mean(merged_data$Body_Weight_1, na.rm = TRUE),
    Body_Weight_2_Avg = mean(merged_data$Body_Weight_2, na.rm = TRUE),
    Body_Weight_3_Avg = mean(merged_data$Body_Weight_3, na.rm = TRUE),
    Total_Mice = nrow(merged_data)
  )

return(bodyweight_summary)
print(bodyweight_summary)
}
