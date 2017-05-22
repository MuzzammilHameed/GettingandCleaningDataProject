#Get the data
# Download the file and put the file in the data folder
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
#Unzip the file
unzip(zipfile = "./data/Dataset.zip" , exdir = "./data")

#unzipped files are in the folderUCI HAR Dataset. Get the list of the files
path_rf <- file.path("./data", "UCI HAR Dataset")
files <- list.files(path_rf, recursive = TRUE)

#For the purposes of this project, the files in the Inertial Signals folders are not used.Values of Varible Activity consist of data from “Y_train.txt” and “Y_test.txt”
#values of Varible Subject consist of data from “subject_train.txt” and subject_test.txt"
#Values of Varibles Features consist of data from “X_train.txt” and “X_test.txt”
#Names of Varibles Features come from “features.txt”
#levels of Varible Activity come from “activity_labels.txt”

#Read Activity Files
dataActivityTest <- read.table(file.path(path_rf, "test","Y_test.txt"), header = FALSE)
dataActivityTrain <- read.table(file.path(path_rf, "train","Y_train.txt"), header = FALSE)
#Read Subject Files
dataSubjectTest <- read.table(file.path(path_rf,"test","subject_test.txt"),header = FALSE)
dataSubjectTrain <- read.table(file.path(path_rf,"train","subject_train.txt"),header = FALSE)
#Read Features Files
dataFeatueTest <- read.table(file.path(path_rf,"test","X_test.txt"), header = FALSE)
dataFeatueTrain <- read.table(file.path(path_rf,"train","X_train.txt"), header = FALSE)

#Merges the training and the test sets to create one data set
#Concatenate the data tables by rows
dataSubject <- rbind(dataSubjectTrain,dataSubjectTest)
dataActivity <- rbind(dataActivityTrain,dataActivityTest)
dataFeature <- rbind(dataFeatueTrain,dataFeatueTest)
#set names to variables
names(dataSubject) <- c("subject")
names(dataActivity) <- c("activity")

dataFeatureNames <- read.table(file.path(path_rf,"features.txt"), header = FALSE )
names(dataFeature) <- dataFeatureNames$V2

#Merge columns to get the data frame Data for all data
dataCombine <- cbind(dataSubject,dataActivity)
Data <- cbind(dataFeature,dataCombine)

#Extracts only the measurements on the mean and standard deviation for each measurement
#Subset Name of Features by measurements on the mean and standard deviation
subdataFeaturesNames<-dataFeatureNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeatureNames$V2)]
#Subset the data frame Data by seleted names of Features
selectedNames <- c(as.character(subdataFeaturesNames),"subject","activity")
Data <- subset(Data,select = selectedNames)

#Uses descriptive activity names to name the activities in the data set
#Read descriptive activity names from “activity_labels.txt”
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)
#factorize Variale activity in the data frame Data using descriptive activity names
Data$activity <- factor(Data$activity,levels = as.integer(activityLabels$V1),labels = activityLabels$V2)

#Appropriately labels the data set with descriptive variable names
#prefix t is replaced by time, Acc is replaced by Accelerometer,Gyro is replaced by Gyroscope,prefix f is replaced by frequency, Mag is replaced by Magnitude,BodyBody is replaced by Body

names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

#Creating second independent tidy data set with the average of each variable for each activity and each subject based on the data set above

library(plyr);
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2 <- Data2[order(Data2$subject,Data2$activity), ]
write.table(Data2, file = "tidyData.txt", row.names = FALSE)
