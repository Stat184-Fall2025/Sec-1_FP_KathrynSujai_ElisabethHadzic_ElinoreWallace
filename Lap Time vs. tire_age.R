# Lap Time vs. Tire Age Visualization

# 1: Load needed packages
library(tidyverse)
library(ggplot2)

# 2:
laps_stints_data %>%
  group_by(driver_number, stint_number) %>% # group by driver and stint
  arrange(lap_number) %>%
  mutate(
    stint_lap = row_number() - 1,
  ) %>%
  ggplot(aes(x=stint_lap, y=lap_duration, color = compound)) + # map the aesthetics
  geom_smooth(se = FALSE) +
  theme_minimal() +
  labs(
    title = "Lap Time vs. Tire Age by Tire Compound",
    x = "Laps into Stint",
    y = "Lap Time",
    color = "Compound"
  )
