
The data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

R script called run_analysis.R that does the following.

Read data from the files into the variables dataActivityTest,dataActivityTrain,dataSubjectTest,dataSubjectTrain,dataFeatureTest,dataFeatureTain

Merges the training and the test sets to create one data set in 2 steps First it Concatenate the data tables by rows dataSubject,dataActivity,dataFeature and secondly Merge columns to get the data frame Data for all data

Extracts only the measurements on the mean and standard deviation for each measurement. Subset Name of Features by measurements on the mean and standard deviation subdataFeaturesNames Subset the data frame Data by seleted names of Features

Uses descriptive activity names to name the activities in the data set. First reads descriptive activity names from “activity_labels.txt” in activityLabels factorize Variale activity in the data frame Data using descriptive activity names

Appropriately labels the data set with descriptive variable names.prefix t is replaced by time,Acc is replaced by Accelerometer,Gyro is replaced by Gyroscope,prefix f is replaced by frequency,Mag is replaced by Magnitude, BodyBody is replaced by Body

From the data set in above step it creates a second, independent tidy data set with the average of each variable for each activity and each subject.
