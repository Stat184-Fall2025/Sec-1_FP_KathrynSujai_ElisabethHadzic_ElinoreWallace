library(ggplot2)
library(tidyverse)

stint1_data <- laps_stints_data %>% #create new dataframe with only stint 1 data
  filter(stint_number == 1) 

ggplot( #create a graph that shows optimum tire age
  stint1_data,
  mapping = aes(
    x = lap_number,
    y = lap_duration,
    color = compound
  ) 
) +
  geom_smooth(se = FALSE) + #line of best fit
  labs(
    title = "Comparison of Optimized Tire Age by Coumpound",
    x = "Lap Number",
    y = "Lap Times",
    color = "Compound Types"
  )