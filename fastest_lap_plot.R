# Load Needed Packages
library(ggplot2)
library(dplyr)
library(tidyverse)

# Edit data to make specific to fastest drivers
fastest_lap <- laps_stints_data %>%
  filter(last_name %in% c("Russell", "Sargeant", "Verstappen", "Perez", "Sainz")) #filter for only the top drivers

fastest_lap %>%
  arrange(driver_number, stint_number, lap_number) %>% #make laps ordered correctly within each stint and driver
# Make stint number a factor to plot 
  mutate(
    stint_number_fac = as.factor(stint_number),
  ) %>%
# Makes each row treated independently
  rowwise() %>%
# Creates a unique identifier for each driver's  stint
  mutate(
    stint_drive = paste(stint_number, driver_number, sep = "-")
  )

# Create the data visualization
fastest_lap %>%
  ggplot( #select data
    mapping = aes( #assign variables
      x = lap_number,
      y = lap_duration,
      color = compound,
      linetype = compound,
      group = stint_drive
    )
  ) +
  geom_path() + #create line plot
  labs( #add labels
    title = "Duration of Lap Overtime of the Race",
    x = "Lap Number",
    y = "Lap Time (seconds)"
  ) +
  facet_wrap(vars(last_name), ncol = 1) + #create one vertical panel per driver
  scale_color_manual(values = c("HARD" = "blue", "MEDIUM" = "red", "SOFT" = "green")) + #set colors
  theme_bw()


