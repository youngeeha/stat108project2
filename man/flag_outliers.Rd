% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flag_outliers.R
\name{flag_outliers}
\alias{flag_outliers}
\title{Flag Outliers in Body Weight Measurements}
\usage{
flag_outliers(
  data = merged_data,
  weight_cols = c("Body_Weight_1", "Body_Weight_2", "Body_Weight_3"),
  threshold = 1.5
)
}
\arguments{
\item{data}{A data frame containing body weight measurements across different weeks (default is merged_data)}

\item{weight_cols}{A vector of column names for the body weight measurements (default is included)}

\item{threshold}{The multiplier for the IQR to define outliers (default is 1.5).}
}
\value{
A data frame with additional columns indicating whether each weight is an outlier.
}
\description{
Flag Outliers in Body Weight Measurements
}
\examples{
flag_outliers(bodyweight_data, weight_cols = c("Body_Weight_1", "Body_Weight_2", "Body_Weight_3"))

}
