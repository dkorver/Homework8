
library(tidyverse)
library(janitor)
bike_data <- read_csv("https://www4.stat.ncsu.edu/online/datasets/SeoulBikeData.csv",locale = locale(encoding = "ISO-8859-1"))
bike_data <- bike_data %>% janitor::clean_names()

class(bike_data)
typeof(bike_data)

sum_na <- function(column){
  sum(is.na(column))
}

na_counts <- bike_data |>
  summarize(across(everything(), sum_na))
na_counts

summary(bike_data)
bike_data$date_new<-as.Date(bike_data$date,format="%m/%d/%y")
bike_data <- bike_data %>% mutate(across(where(is.character), as.factor))
summary(bike_data$rented_bike_count)


