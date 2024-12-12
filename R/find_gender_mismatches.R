#' Find Gender Mismatch
#'
#'This function identifies gender mismatches between sex and sex_inferred.
#'
#' @param data A dataframe that contains sex, treatment, bodyweight, and id info, default is merged_data.
#'
#' @return A tibble containing rows where `Sex` does not match `Sex_inferred`.
#' @export
find_gender_mismatches <- function(data = merged_data) {
  gender_mismatch <- data |>
    dplyr::filter(Sex != Sex_inferred)

  if (nrow(gender_mismatch) == 0) {
    print("No gender mismatches found.")
  } else {
    print("Gender Mismatches:")
    print(gender_mismatch$ID)
  }

  # Return the mismatch data
  return(gender_mismatch)
}
