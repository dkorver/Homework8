
library(tidyverse)
library(janitor)
library(tidymodels)
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

set.seed(123)
cell_split <- initial_split(cells %>% select(-case),strata = class)
cell_train <- training(cell_split)
cell_test  <- testing(cell_split)
nrow(cell_train)
nrow(cell_train)/nrow(cells)
cell_train %>% 
  count(class) %>% 
  mutate(prop = n/sum(n))

cell_test %>% 
  count(class) %>% 
  mutate(prop = n/sum(n))



