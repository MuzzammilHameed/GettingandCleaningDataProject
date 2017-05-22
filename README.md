# GettingandCleaningDataProject
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The file run_analysis.R contains code to Merges the training and the test sets to create one data set callled Data.Extracts only the measurements on the mean and standard deviation for each measurement.Uses descriptive activity names to name the activities in the data set. Appropriately labels the data set with descriptive variable names. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

First get working directory by command getwd()
Place the run_analysis.R in the working directory obtained from previous command
set source to run_analysis.R by command source(run_analysis.R) It will create a txt file "tidyData.txt" in same folder
use command TidyData <- read.table("tidyData.txt") to read the newly created txt file. use str(TidyData) to obtain summary of data its a data.frame':	181 obs. of  68 variables:


