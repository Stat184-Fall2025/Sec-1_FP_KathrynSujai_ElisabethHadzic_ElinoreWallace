# Load Needed Packages
library(kableExtra)
library(knitr)
library(tidyverse)
library(dplyr)

# Create the new Data Frame for the Table
fastest_lapstat <- fastest_lap %>%
  select( #eliminate unessecary columns 
         -driver_number, 
         -lap_number, 
         -stint_number, 
         -lap_start,
         -lap_end, 
         -tyre_age_at_start, 
         -stint_length, 
         -team_name, 
         -first_name) %>%
  group_by(last_name, compound) %>% #group name and compound variables together
  summarise( #calculate the values for the data
    Min = min(lap_duration, na.rm = TRUE),
    Q1 = quantile(lap_duration, probs = 0.25, na.rm = TRUE),
    Median = median(lap_duration, na.rm = TRUE),
    Q3 = quantile(lap_duration, probs = 0.75, na.rm = TRUE),
    Max = max(lap_duration, na.rm = TRUE),
    Mean = mean(lap_duration, na.rm = TRUE),
    Standard_Deviation = sd(lap_duration, na.rm = TRUE),
    .groups = "drop"
  )
# Create new data set for the table
fastest_lap_table <- fastest_lapstat

# Rename column names to be more proper
names(fastest_lap_table) <- c(
  "Driver Last Name",
  "Compound",
  "Minimum",
  "Quartile 1",
  "Median",
  "Quartile 3",
  "Maximum",
  "Mean",
  "Standard Deviation"
)
# Create the table
fastest_lap_table%>%
  kable(
    caption = "Summary Table for Top 5 Drivers with the Fastest Lap", #add captions
    align = c("l", rep("c", 10)),
    digits = 3 #round to 3 decimals
  ) %>%
  kable_classic(
    font_size = 16, #edit font size
    lightable_options = "striped" #make table easier to read and striped
    )

