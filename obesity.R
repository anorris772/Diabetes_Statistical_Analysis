# Alex Norris


###########################
#
#       Obesity
#
###########################

library(tidyverse)
library(ggpubr)

nationalObesity = read.csv("C:/Users/anorr/Desktop/Stat6000/FinalProject/Diabetes_Statistical_Analysis/data/NationalObesity/NationalAggregated.csv", header=TRUE)
alabamaObesity = read.csv("C:/Users/anorr/Desktop/Stat6000/FinalProject/Diabetes_Statistical_Analysis/data/AlabamaObesity/AlabamaAggregated.csv", header=TRUE)


nationalO <- nationalObesity %>%
  filter(Race.Ethnicity != "2 or more races" &
           Race.Ethnicity != "Other")

ggplot(nationalO, aes(x = YearStart, 
                      y = as.numeric(Data_Value), 
                      col = as.factor(Race.Ethnicity))) + 
  geom_point(size = 3) +
  xlab("Year") + ylab("Obesity Rate") +
  labs(title = "National Rates of Obesity by Race", col="Race") +
  stat_smooth(method = "lm", se = FALSE) +
  stat_cor()


# Alabama data lacks values for certain races, so we filter them out
alabamaO <- alabamaObesity %>%
  filter(Race.Ethnicity != "2 or more races" &
           Race.Ethnicity != "Other" &
           Race.Ethnicity != "Asian" &
           Race.Ethnicity != "Hawaiian/Pacific Islander")

ggplot(alabamaO, aes(x = YearStart, 
                     y = as.numeric(Data_Value), 
                     col = as.factor(Race.Ethnicity))) + 
  geom_point(size = 3) +
  xlab("Year") + ylab("Obesity Rate") +
  labs(title = "Rates of Obesity in Alabama by Race", col="Race") +
  stat_smooth(method = "lm", se = FALSE) +
  stat_cor()





nationalComp <- nationalObesity %>%
  filter(Race.Ethnicity != "2 or more races" &
           Race.Ethnicity != "Other" &
           Race.Ethnicity != "Asian" &
           Race.Ethnicity != "Hawaiian/Pacific Islander" &
           Race.Ethnicity != "American Indian/Alaska Native")

alabamaComp <- alabamaObesity %>%
  filter(Race.Ethnicity != "2 or more races" &
           Race.Ethnicity != "Other" &
           Race.Ethnicity != "Asian" &
           Race.Ethnicity != "Hawaiian/Pacific Islander" &
           Race.Ethnicity != "American Indian/Alaska Native")


ggplot(alabamaComp, aes(x = YearStart, 
                        y = as.numeric(Data_Value), 
                        col = as.factor(Race.Ethnicity))) + 
  geom_point(size = 3) +
  xlab("Year") + ylab("Obesity Rate") +
  labs(title = "Obesisty Rates by Race in Alabama", col="Race", 
       caption = "National Rate In Dashed Line") +
  stat_smooth(method = "lm", se = FALSE) +
  stat_smooth(method = "lm",linetype = "dashed", se = FALSE, 
              data = nationalComp, aes(x = YearStart, 
                                       y = as.numeric(Data_Value),
                                       col = as.factor(Race.Ethnicity))) +
  stat_cor()
