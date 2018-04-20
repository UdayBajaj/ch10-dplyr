# Exercise 6: dplyr join operations

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library(nycflights13)
library(dplyr)

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
average_arrival_delays <- flights %>%
  group_by(dest) %>%
  summarise(average_delay = mean(arr_delay, na.rm = TRUE)) %>%
  mutate(faa = dest) %>%
  left_join(airports, by = 'faa') %>%
  filter(average_delay == max(average_delay, na.rm = TRUE))
average_arrival_delays

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
smallest_avg_arrival_delay <- flights %>%
  group_by(carrier) %>%
  summarise(delays = mean(arr_delay, na.rm = TRUE)) %>%
  left_join(airlines, by = 'carrier') %>%
  filter(delays == max(delays, na.rm = TRUE))
smallest_avg_arrival_delay

