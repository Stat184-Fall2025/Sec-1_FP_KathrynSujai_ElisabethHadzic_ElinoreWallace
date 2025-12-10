# Driver's fastest lap per compound table

# 1: Load needed packages
library(tidyverse)
library(kableExtra)
library(knitr)

# 2: Filter for medium tires and find fastest laps
medium_fastest <- laps_stints_data %>% 
  filter(compound == "MEDIUM") %>% # filter for medium compound
  group_by(driver) %>% # group by driver
  summarise(
    fastest_lap = min(lap_duration), # take min lap time for fastest
  ) %>%
  arrange(fastest_lap) # sort lap times

# 3: Create the table with kableExtra
medium_fastest %>%
  kable(
    caption = "Driver's Fastest Lap on the Medium Compound", # add title
    col.names = c("Driver", "Fastest Lap (Medium)"), # apply column names
    align = c("l", "c"),
    booktabs = TRUE,
  ) %>%
  kableExtra::kable_classic(
    font_size = 15,
    lightable_options = "striped" # style type
  )
