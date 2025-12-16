# Tire Compound Impact in Formula One

This repository is a data analysis project that compares tire compounds and lap times for the Hungarian Grand Prix in 2024. Our group wanted to answer: What is the best tire compound for the Hungarian Grand Prix 2024?

## Overview

Our goal is to explore the relationship between tire compounds and lap times. We compare three compounds(soft, medium, and hard) to determine how effective they are for a driver's pace. 

### Interesting Insight

Soft tires are known for their short tire age/stint length but there quick speeds. This analysis, however, provided the opposite. The soft tires still lasted the shortest but looking at the figure below, we see that the soft tire was the slowest of the three compounds on average. The quickest average lap time for soft, was slower than both the hard and medium which is uncommon. We can conclude that the soft tire is not an opitmal choice for the Hungarian Grand Prix.

<img src="Tables_and_Figures/AvgLapTime_TireAge.png" alt="Average Lap Time by Tire Age" width="500">

## Data Sources and Acknowledgements

The data comes from an open-source API [OpenF1](https://openf1.org/). It contains historical and real time F1 data. For our data, we combined driver data, lap data, and stint data. There were 2 issues in the data: lap 1 having incomplete data and outlaps having significantly higher lap time. We removed rows for lap 1 because it didn't count as a full lap and was N/A. We removed outlaps because they were outliers and not a fair and accurate representation of lap time on a compound.

## Current Plan

With this data, we plan to showcase the relationship between tire compounds to lap times in Formula 1 racing. This will include a QMD file showing various data visualizations and tables. We will explore the impact of the tire type on lap time, when tire age and compound is at its peak, and how it impacts attaining both the fastest lap and finishing top 5 in the race. To do this we will
    - load the data into R
    - join the data
    - tidy the data
    - filter the data depending on what aspect of the data is being analyized
    - create data visualizations and tables
    - improve the visalizations and tables 
    - create the work in progress power point
    - present the power point in class
    - make any needed edits to data visualizations and data tables
    - create the QMD and add it into the repository
    - add the pdf form of the QMD into the repository
    

## Repo Structure

All files will be found in the top level. The data files and code can be found in the "Data" folder. The visualizations and tables code can be found in the "Tables_and_Figures" folder.

## Authors

Kathryn Sujai, Elisabeth Hazic, Ellie Wallace

For further information about this project, please contact [Elisabeth Hadzic](mailto:elisabeth.hadzic@gmail.com)
