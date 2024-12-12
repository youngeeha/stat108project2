#' Plot Mouse Weight
#'
#'This function plots the bodyweight of mice over time
#'
#' @param data A dataframe that contains sex, treatment, bodyweight, and id info, default is merged_data
#'
#' @return A plot highlight the change in mouse weight over time
#' @export
#'
#' @examples
plot_mouse_weight <- function(data = merged_data) {
  bodyweight_long <- tidyr::pivot_longer(
    data,
    cols = starts_with("Body_Weight"),
    names_to = "Time",
    values_to = "Weight"
  )


  # Create the Plotly chart
  plot <- ggplot2::ggplot(data = bodyweight_long, ggplot2::aes(x = Time, y = Weight, color = Num)) +
    ggplot2::geom_line(ggplot2::aes(group = ID)) +  # Add lines connecting the points for each ID
    ggplot2::labs(
      title = "Mouse Weight Over Time",
      x = "Time",
      y = "Weight in grams"
    ) +
    ggplot2::theme_minimal()

  return(plot)
}
