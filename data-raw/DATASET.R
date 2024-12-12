# data-raw/DATASET.R
# Code to prepare `birth_data`, `bodyweight_data`, and `outcome_data` datasets

# Load required packages
readxl::read_excel
dplyr::mutate
stringr::str_replace

# Load the data
birth_data <- readxl::read_excel("mousedata.xlsx", sheet = "Birth")
bodyweight_data <- readxl::read_excel("mousedata.xlsx", sheet = "Body Weight")
outcome_data <- readxl::read_excel("mousedata.xlsx", sheet = "Outcome")

# Fix typos in the Treatment column
birth_data <- birth_data |>
  dplyr::mutate(Treatment = dplyr::case_when(
    Treatment == "Placobo" ~ "Plac",
    Treatment == "Trmt" ~ "Tmt",
    TRUE ~ Treatment
  ))

# Clean Body Weight columns
bodyweight_data <- bodyweight_data |>
  dplyr::mutate(dplyr::across(
    dplyr::starts_with("Body Weight"),
    ~ as.numeric(stringr::str_replace(.x, "Dead", NA_character_))
  ))

# Extract gender from the ID in bodyweight_data
bodyweight_data <- bodyweight_data |>
  dplyr::mutate(Sex_inferred = dplyr::if_else(
    stringr::str_detect(ID, "_F_"),
    "F",
    "M"
  ))

# fixing naming typos
colnames(bodyweight_data) <- str_replace_all(colnames(bodyweight_data), "\\s+", "_")
colnames(outcome_data) <- str_replace_all(colnames(outcome_data), "\\s+", "_")

outcome_data <- outcome_data |>
  rename(ID = Subject_ID)

outcome_data <- outcome_data |>
  rename(Date_Outcome_1 = Date_Ourcome_1)

bodyweight_data <- bodyweight_data |>
  rename(Date_Body_Weight_2 = Date_Body_Weight_2...5)

bodyweight_data <- bodyweight_data |>
  rename(Date_Body_Weight_3 = Date_Body_Weight_2...7)


merged_data <- birth_data |>
  full_join(bodyweight_data, by = "ID") |>
  full_join(outcome_data, by = "ID")

# Removing mice with >20% bodyweight loss or dead ----------------------------
body_weight_columns <- c("Body_Weight_1", "Body_Weight_2", "Body_Weight_3")

# Removing rows with NA in any body weight column
has_na <- apply(merged_data[body_weight_columns], 1, function(row) any(is.na(row)))

# Identify rows with a 20% or more decrease in body weight
weight_decrease <- apply(merged_data[body_weight_columns], 1, function(row) {
  # Calculate differences between consecutive columns
  diffs <- diff(as.numeric(row), lag = 1)
  # Calculate percentage decrease relative to the previous value
  perc_decrease <- diffs / head(as.numeric(row), -1)
  # Check if any decrease exceeds 20%
  any(perc_decrease <= -0.2, na.rm = TRUE)
})

merged_data <- merged_data[!(has_na | weight_decrease), ]

# ---------------------------------------------------------------------------
# Save the processed datasets
usethis::use_data(birth_data, overwrite = TRUE)
usethis::use_data(bodyweight_data, overwrite = TRUE)
usethis::use_data(outcome_data, overwrite = TRUE)
usethis::use_data(merged_data, overwrite = FALSE)
