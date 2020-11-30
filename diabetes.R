# Alex Norris - oan0003
# Stat 6000 - FinalProject


# Diabetes data located here https://gis.cdc.gov/grasp/diabetes/DiabetesAtlas.html#
# Within the compressed directory, there are 3 files
# 1. National_Data.csv
# 2. Data_Dictionary_National_1980_2017.docx
# 3. Lookup_Table.xlsx

# Read in the national diabetes data set from the CDC, covers 1980 to 2017
archive = read.csv("C:/Users/Alex/Desktop/Fall20/Stat6000/data/National_Data.csv", header=TRUE)


# Throughout this project the Tidyverse package for R is utilized
# install.packages("tidyverse")
library(tidyverse)


# Start by narrowing down to just new diagnoses
# Fetch all rows that are classified as "newly diagnosed"
# 'indicatorid' of 2 represents a group that is newly diagnosed with diabetes
# Also filter by 'estimateid' of 2 to get rate per 1000 people
newly_diagnosed = dplyr::filter(archive, indicatorid == 2 & estimateid == 72)

year_race_rate_estimate = dplyr::select(newly_diagnosed, yearid, raceid, Estimate)





plot(year_race_rate_estimate)
ggplot(data = year_race_rate_estimate, aes(x = yearid, y = Estimate))




# Select just the races from the newly_diagnosed table)
race = dplyr::select(newly_dignosed, raceid)
# find unique entires in the race table
unique(race)
# only race 0(total), 1(white), 2(black), and 7(Hispanic) 
white = dplyr::filter(year_race_rate_estimate, raceid == 1)
black = dplyr::filter(year_race_rate_estimate, raceid == 2)
hisp = dplyr::filter(year_race_rate_estimate, raceid == 7)
