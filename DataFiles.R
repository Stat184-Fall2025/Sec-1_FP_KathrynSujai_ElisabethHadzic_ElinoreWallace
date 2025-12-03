# Load Needed Packages
library(httr)
library(jsonlite)
library(tidyverse)

# Import the Stint data
response <- GET('https://api.openf1.org/v1/stints?meeting_key=1224')
stint_data <- fromJSON(content(response, 'text'))
print(stint_data)

# Import the Lap data
response1 <- GET('https://api.openf1.org/v1/laps?meeting_key=1224')
laps_data <- fromJSON(content(response1, 'text'))
print(laps_data)


# Clean the Stint Data
stint_data_clean <- stint_data %>%
  filter(
    session_key == 9205 # filter for the race session only
  ) %>%
  select( # Select needed columns
    stint_number,
    driver_number,
    lap_start,
    lap_end,
    compound,
    tyre_age_at_start
  )

# Clean the Laps Data
laps_data_clean <- laps_data %>%
  filter(
    session_key == 9205, # filter for the race session only
    lap_number != 1, # remove lap 1 due to incomplete data 
    is_pit_out_lap == FALSE # remove outlaps to prevent outliers
    ) %>%
  select( # Select needed columns
    driver_number,
    lap_number,
    lap_duration
  )

# Join the data
laps_stints_data <- laps_data_clean %>%
  left_join(stint_data_clean, by = "driver_number") %>% # join on driver number
  filter(lap_number >= lap_start & lap_number <= lap_end) # assign lap time to correct stint

  
