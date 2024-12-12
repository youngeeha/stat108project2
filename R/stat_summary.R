#' Stat_summary
#'
#'This function outputs statistical summaries regarding bodyweight data for the mice.
#'
#' @param data A dataframe that contains sex, treatment, bodyweight, and id info, default is merged_data
#'
#' @return A list containing the statistical summary table, t-test p-value (comparing Bodyweight 1 and 3), and ANOVA p-value (for 3 bodyweights).
#'
#' @export
stat_summary <- function(data = merged_data) {

  t_test <- t.test(data$Body_Weight_1, merged_data$Body_Weight_3, paired = TRUE)
  t_test_p_value <- t_test$p.value

  # Reshape data for ANOVA
  bodyweight_long <- tidyr::pivot_longer(
    data,
    cols = starts_with("Body_Weight"),
    names_to = "Time",
    values_to = "Weight"
  )

  # Create a statistical summary table
  summary_table <- bodyweight_long |>
    dplyr::group_by(Time) |>
    dplyr::summarise(
      avg = mean(Weight, na.rm = TRUE),
      std = sd(Weight, na.rm = TRUE),
      min = min(Weight, na.rm = TRUE),
      max = max(Weight, na.rm = TRUE),
      .groups = "drop"
    )

  # Perform ANOVA
  anova_result <- aov(Weight ~ Time, data = bodyweight_long)
  anova_p_value <- summary(anova_result)[[1]][["Pr(>F)"]][1]

  # Printng the t-test and ANOVA p-values
  print(paste("T-Test P-Value:", t_test_p_value))
  print(paste("ANOVA P-Value:", anova_p_value))

  # returning table
  return(list(
    summary_table = summary_table,
    t_test_p_value = t_test_p_value,
    anova_p_value = anova_p_value
  ))
}


