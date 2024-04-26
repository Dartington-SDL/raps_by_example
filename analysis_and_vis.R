# Set the working directory location
setwd('~/OneDrive - Warren House Group/DSDL/Projects/Think Forward/capacity_development/raps_and_tools/')

# Read in the raw data in CSV format
data <- read.csv('data/report1_transform.csv')

data$Amount <- as.numeric(data$Amount)
data$Total.Price <- as.numeric(data$Total.Price)

tot_amount <- sum(data$Amount)
tot_price <- sum(data$Total.Price)

negot_sub <- data[data$Stage == "Negotiation", ]
negot_tab <- negot_sub[c("Account.Name", "project_length", "Amount", "Total.Price")]

acc_count <- table(data$Account.Name)
cust_plt <- barplot(acc_count)

max_count <- which.max(acc_count)
max_value <- acc_count[[max_count]]
max_name <- names(max_count)

options(scipen = 5)
price_amount_plt <- plot(data$project_length, data$Total.Price,
                         xlab = "Project length (days)",
                         ylab = "Total price (GBP)")



