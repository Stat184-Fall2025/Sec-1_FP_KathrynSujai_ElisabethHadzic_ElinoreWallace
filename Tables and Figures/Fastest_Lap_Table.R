# Driver's fastest lap per compound table
# Author: Elisabeth Hadzic

# 1: Load needed packages
library(tidyverse)
library(kableExtra)
library(knitr)

# 2: Filter for medium tires and find fastest laps
compound_fastest <- laps_stints_data %>%
  filter(compound %in% c("SOFT", "MEDIUM", "HARD")) %>%  # filter 3 compounds
  mutate(compound = factor(compound, levels = c("SOFT", "MEDIUM", "HARD"))) %>% # to stay in order
  group_by(driver, compound) %>% # group by driver and compound
  summarise(
    fastest_lap = min(lap_duration, na.rm = TRUE), # take min lap time for fastest
  ) %>%
  pivot_wider(
    names_from = compound,
    values_from = fastest_lap
  )

# 3: Create the table with kableExtra
compound_fastest %>%
  kable(
    caption = "Driver's Fastest Lap on each Compound", # add title
    col.names = c("Driver", "Soft", "Medium", "Hard"), # apply column names
    align = c("l", "c", "c", "c"),
    booktabs = TRUE,
  ) %>%
  kableExtra::kable_classic(
    font_size = 15,
    lightable_options = "striped" # style type
  )
