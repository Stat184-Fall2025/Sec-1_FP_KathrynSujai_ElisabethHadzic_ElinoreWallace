# Data Wrangling
# Author: Elisabeth Hadzic

# Load Needed Packages
library(httr)
library(jsonlite)
library(tidyverse)

# Import the Stint data
response <- GET('https://api.openf1.org/v1/stints?meeting_key=1241') # meeting key 1241 = Hungary 2024
stint_data <- fromJSON(content(response, 'text'))

# Import the Lap data
response1 <- GET('https://api.openf1.org/v1/laps?meeting_key=1241')
laps_data <- fromJSON(content(response1, 'text'))

# Import Driver Data
response3 <- GET('https://api.openf1.org/v1/drivers?meeting_key=1241&session_key=9566')
drivers_data <- fromJSON(content(response3, 'text'))


# Clean the Stint Data
stint_data_clean <- stint_data %>%
  filter(
    session_key == 9566 # filter for the race session only
  ) %>%
  select( # Select needed columns
    stint_number,
    driver_number,
    lap_start,
    lap_end,
    compound,
    tyre_age_at_start
  ) %>%
  mutate(
    stint_length = (lap_end + 1) - lap_start # create a stint_length column
  )

# Clean the Laps Data
laps_data_clean <- laps_data %>%
  filter(
    session_key == 9566, # filter for the race session only
    lap_number != 1, # remove lap 1 due to incomplete data 
    is_pit_out_lap == FALSE # remove outlaps to prevent outliers
    ) %>%
  select( # Select needed columns
    driver_number,
    lap_number,
    lap_duration
  )

# Clean the Driver Data
driver_data_clean <- drivers_data %>%
  mutate(driver = paste(first_name, last_name, sep = " ")) %>% # Combine first and last name columns
  select( # Select needed columns
    driver_number,
    team_name,
    driver
  )

# Join the data
laps_stints_data <- laps_data_clean %>%
  left_join(stint_data_clean, by = "driver_number", relationship = "many-to-many") %>%
  left_join(driver_data_clean, by = "driver_number") %>% # join on driver number
  filter(lap_number >= lap_start & lap_number <= lap_end) # assign lap time to correct stint


  
