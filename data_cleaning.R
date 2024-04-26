# Set the working directory location
setwd('~/OneDrive - Warren House Group/DSDL/Projects/Think Forward/capacity_development/raps_and_tools/')

# Read in the raw data in CSV format
data <- read.csv('data/report1.csv')

# Function to split a text string in a given dataframe column and return
# the text to left of the split point
# Inputs - data: dataframe, col_name: column in dataframe as a string,
# split: where to split the text as a string
# Output - data: dataframe
text_remove <- function(data, col_name, split){
  data[[col_name]] <- sapply(strsplit(data[[col_name]],
                                           split = split, fixed=TRUE),
                                  function(x) (x[1]))
  return(data)
}

# Run the function text remove to remove " (sample)" from all column entries
data <- text_remove(data, "Opportunity.Name", " (")
data <- text_remove(data, "Account.Name", " (")

write.csv(data,'data/report1_clean.csv', row.names = FALSE)
