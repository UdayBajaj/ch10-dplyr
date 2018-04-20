# Exercise 5: dplyr grouped operations

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library(nycflights13)
library(dplyr)

View(flights)
# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
avg_monthly_delay <- flights %>%
  group_by(month) %>%
  summarise(delay = mean(dep_delay, na.rm = TRUE))
avg_monthly_delay

# Which month had the greatest average departure delay?
filter(avg_monthly_delay, delay == max(delay)) %>% select(month)
# the month of July (month 7)

View(avg_monthly_delay)
# If your above data frame contains just two columns (e.g., "month", and "delay" in that order), you can create
# a scatterplot by passing that data frame to the 'plot()' function
plot(avg_monthly_delay)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
avg_arrival_delay <- flights %>%
  group_by(dest) %>%
  summarise(delay = mean(arr_delay, na.rm = TRUE)) %>%
  arrange(-delay)
head(avg_arrival_delay)

# You can look up these airports in the `airports` data frame!
filter(airports, faa == avg_arrival_delay$dest[2])
# [1] Columbia Metropolitan
# [2] TUlsa international

# Which city was flown to with the highest average speed?
highest_avg_speeed <- flights %>%
  mutate(speed = distance/air_time * 60) %>%
  group_by(dest) %>%
  summarise(avg_speed = mean(speed, na.rm = TRUE)) %>%
  filter(avg_speed == max(avg_speed, na.rm = TRUE))
highest_avg_speeed
  
  