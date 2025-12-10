# Lap Time vs. Tire Age Visualization

# 1: Load needed packages
library(tidyverse)
library(ggplot2)

# 2:Create the line plot
laps_stints_data %>%
  group_by(driver_number, stint_number) %>% # group by driver and stint
  arrange(lap_number) %>%
  mutate(
    stint_lap = row_number() - 1, # resets the stint lap number to 1 for each new stint
  ) %>%
  ggplot(aes(x=stint_lap, y=lap_duration, color = compound, linetype = compound)) + # map the aesthetics
  geom_smooth(se = FALSE) + # smooths the line
  theme_minimal() +
  labs( # Adds labels to the plot
    title = "Average Lap Time vs. Tire Age by Tire Compound",
    x = "Tire Age",
    y = "Lap Time",
    color = "Compound"
  )
