# Diabetes_Statistical_Analysis
This project aims to identify current trends and relationships within diabetes data from the CDC. 
Data for this project can be found here https://gis.cdc.gov/grasp/diabetes/DiabetesAtlas.html under 'Archived Data'.
See below for descriptions of each applied method and instructions on how to run the code.

## Included Code
Three R scripts are included in the repo. Only "diabetes.R" and "obesity.R" were utilized in the report. Future work is planned for "excercise.R".

## Running the Code
1. Use R Studio or another IDE like Spyder for visualizing the plots.
2. The two scripts utilize both the Tidyverse and ggpubr packages that can be installed with `install.packages("PACKAGE")` command.
3. Each script reads in CSV files from custom paths based on the host system, please change to match your path to the data.
4. Future imporvments will be made to containerizing the code and project.