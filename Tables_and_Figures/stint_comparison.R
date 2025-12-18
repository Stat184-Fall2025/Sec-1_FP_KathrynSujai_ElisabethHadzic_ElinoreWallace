# Load Needed Packages
library(kableExtra)
library(knitr)
library(tidyverse)


stint_softs <- stint_data_clean %>% #create a new data-frame for soft tire compounds
  filter(compound == "SOFT") %>% #filters out only data for soft tires
  summarise( #finds the min lap length, max lap length, and average tire age, and total used
    compound = "SOFT",
    Min = min(stint_length, na.rm = TRUE),
    Max = max(stint_length, na.rm = TRUE),
    Mean = mean(stint_length, na.rm = TRUE),
    count = n()
  )

stint_mediums <- stint_data_clean %>% #create a new data-frame for medium tire compounds
  filter(compound == "MEDIUM") %>% #filters out only data for medium tires
  summarise(
    compound = "MEDIUM",
    Min = min(stint_length, na.rm = TRUE),
    Max = max(stint_length, na.rm = TRUE),
    Mean = mean(stint_length, na.rm = TRUE),
    count = n()
  )

stint_hards <- stint_data_clean %>% #create a new data-frame for hard tire compounds
  filter(compound == "HARD") %>% #filters out only data for hard tires
  summarise(
    compound = "HARD",
    Min = min(stint_length, na.rm = TRUE),
    Max = max(stint_length, na.rm = TRUE),
    Mean = mean(stint_length, na.rm = TRUE),
    count = n()
  )

stint_comparison <- bind_rows( #creates a new dataframe with all three tire compound
  stint_softs, stint_mediums, stint_hards
)
  
stint_comparison %>% #creates a clean table using Kable of the compound types
  kable(
    caption = "Summary of Relationship Between Compound Type and Lap Lengths",
    col.names = c("Compound", "Minimum Laps Completed", "Maximum Laps Completed", "Average Lap Length", "Total Tires Used"),
    align = c("l", "c", "c", "c"),
    digits = 2
  ) %>%
  kable_classic(
    font_size = 15,
    lightable_options = "striped"
  )
  
  