# Alex Norris 


###########################
#
#       Diabetes
#
###########################


# Diabetes data located here https://gis.cdc.gov/grasp/diabetes/DiabetesAtlas.html#
# Within the compressed directory, there are 3 files
# 1. National_Data.csv
# 2. Data_Dictionary_National_1980_2017.docx
# 3. Lookup_Table.xlsx

# Read in the national diabetes data set from the CDC, covers 1980 to 2017
archive = read.csv("C:/Users/anorr/Desktop/Stat6000/FinalProject/Diabetes_Statistical_Analysis/data/National_Data.csv", header=TRUE)

# Throughout this project the Tidyverse and ggpubr packages for R are utilized
#install.packages("tidyverse")
#install.packages("ggpubr")
library(tidyverse)
library(ggpubr)
# Start by narrowing down to just new diagnoses
# Fetch all rows that are classified as "newly diagnosed"
# 'indicatorid' of 2 represents a group that is newly diagnosed with diabetes
# Also filter by 'estimateid' of 72 to get rate per 1000 people
newly_diagnosed = dplyr::filter(archive, indicatorid == 2 & estimateid == 72)

# select just the year, race, and estimate attributes from the data
year_race_rate_estimate = dplyr::select(newly_diagnosed, yearid, raceid, Estimate)

# Select just the races from the newly_diagnosed table)
race = dplyr::select(newly_diagnosed, raceid)
# find unique entries in the race table
unique(race)
# unique races: 0(total), 1(white), 2(black), and 7(Hispanic) 


# First visualize diabetes rates across the 3 included races
# Tidyverse + ggplot scatter plot 
# Filter out total race and total age, but keep total gender

race_archive <- archive %>%
  filter(indicatorid == 2 & 
           estimateid == 72 &
           raceid != 0 & 
           genderid == 0 & 
           ageid == 99 & Estimate != ".")

# Plot newly diagnosed diabetes estimates across races
ggplot(race_archive, aes(x = yearid, 
                         y = as.numeric(Estimate), 
                         col = as.factor(raceid))) + 
        geom_point(size = 3) +
        xlab("Year") + ylab("Diabetes Estimate Per 1000") +
        labs(title = "Rates of Diabetes by Race Over Time", col="Race") + 
        scale_color_hue(labels = c("White", "Black", "Hispanic")) +
        stat_smooth(method = "lm", se = FALSE) +
        stat_cor()


# Next visualize the diabetes rates across gender
# Filter out total age and total gender, but keep total race
gender_archive <- archive %>%
  filter(indicatorid == 2 & 
           estimateid == 72 &
           raceid == 0 & 
           genderid != 0 & 
           ageid == 99 & Estimate != ".")

# Plot newly diagnosed diabetes estimates across gender
ggplot(gender_archive, aes(x = yearid, 
                         y = as.numeric(Estimate), 
                         col = as.factor(genderid))) + 
      geom_point(size = 3) +
      xlab("Year") + ylab("Diabetes Estimate Per 1000") +
      labs(title = "Rates of Diabetes by Gender Over Time", col="Gender") + 
      scale_color_hue(labels = c("Male", "Female")) +
      stat_smooth(method = "lm", se = FALSE) +
      stat_cor()










  