# Set the working directory location
setwd('~/OneDrive - Warren House Group/DSDL/Projects/Think Forward/capacity_development/raps_and_tools/')

# Read in the raw data in CSV format
data <- read.csv('data/report1_clean.csv')

# Function to format a dataframe column as a date in a given date format
# Inputs - data: dataframe, col_name: a column containing dates as a string,
# d_format: the date format of the dates as a string
# Outputs - data: dataframe
format_date_col <- function(data, col_name, d_format){
  data[[col_name]] <- as.Date(data[[col_name]], format=d_format)
  
  return(data)
}

# Run the function format_date_col on the named columns
data <- format_date_col(data, "Created.Date", "%d/%m/%Y")
data <- format_date_col(data, "Close.Date", "%d/%m/%Y")

# Function to find the difference between dates in two columns in days
# and return the difference in a new column
# Inputs - data: dataframe, col_1: name of column as a string,
# col_2: name of column as a string, new_col: name of column as a string
# Output - data: dataframe
calc_date_diff <- function(data, col_1, col_2, new_col){
  data[[new_col]] <- data[[col_1]] - data[[col_2]]
  
  return(data)
}

# Run the function calc_date_diff to find the difference between the
# Close.Date column and Created.Date columns returning the difference in
# a new column project_length
data <- calc_date_diff(data, "Close.Date", "Created.Date", "project_length")

# Function to remove any rows with a value less than 0 in a given column
# Inputs - data: dataframe, col_name: name of column as a string
# Output - data: dataframe
remove_neg_rows <- function(data, col_name){
  data <- data[data[[col_name]] >= 0, ]
  
  return(data)
}

# Run the function remove_neg_rows to remove any rows where the value in
# the column project_length is less than 0
data <- remove_neg_rows(data, "project_length")

# Write out the transformed dataframe as a csv file
write.csv(data, "data/report1_transform.csv", row.names = FALSE)
