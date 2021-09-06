# R for Data Science Code

library(nycflights13)
library(tidyverse)


# Data Transformation
# https://r4ds.had.co.nz/transform.html

## 5.2 Filter rows with filter()

filter(flights, month == 1, day == 1)

jan1 <- filter(flights, month == 1, day == 1)

# Wrap in () if you want to print and assign to df
(dec25 <- filter(flights, month == 12, day == 25))

# Logical operators: & and, | or, ! not, xor() exclusive or, 

filter(flights, month == 11 | month == 12)

# Short hand summary

nov_dec <- filter(flights, month %in% c(11, 12))

# DeMorgan's Law
filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120, dep_delay <= 120)

filter(flights, dest == "IAH" | dest == "HOU")

# Select()

# Mutate()
flights_sml <- select(flights, 
                      year:day, 
                      ends_with("delay"), 
                      distance, 
                      air_time
)
mutate(flights_sml,
       gain = dep_delay - arr_delay,
       speed = distance / air_time * 60
)

mutate(flights_sml,
       gain = dep_delay - arr_delay,
       hours = air_time / 60,
       gain_per_hour = gain / hours
)

# To only keep the new variables use transmute()

transmute(flights,
          gain = dep_delay - arr_delay,
          hours = air_time / 60,
          gain_per_hour = gain / hours
)

#  5.6 Grouped summaries with summarise() 

summarise(flights, delay = mean(dep_delay, na.rm = TRUE))
