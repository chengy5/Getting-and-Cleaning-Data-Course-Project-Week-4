## 1.Merges the training and the test sets to create one data set

#Down load and unzip file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "UCI HAR Dataset.zip")
unzip("UCI HAR Dataset.zip") 

#Read features data
features <-read.table("UCI HAR Dataset/features.txt", header = F) 

#Read test data and merge test data into one data set
subject_test <-read.table("UCI HAR Dataset/test/subject_test.txt", 
                          header = F, sep =";", col.names = "VolunteerID",
                          colClasses = "factor")
x_test <-read.table("UCI HAR Dataset/test/X_test.txt", 
                    header = F, col.names = features[1:561,2])
y_test <-read.table("UCI HAR Dataset/test/y_test.txt", 
                    header = F, sep =";", col.names = "Activity", colClasses = "factor")
testdata <-cbind(subject_test,y_test,x_test)

#Read train data and merge train data into one data set
subject_train <-read.table("UCI HAR Dataset/train/subject_train.txt", 
                          header = F,  sep =";", col.names = "VolunteerID", 
                          colClasses = "factor")
x_train <-read.table("UCI HAR Dataset/train/X_train.txt", 
                    header = F, col.names = features[1:561,2])
y_train <-read.table("UCI HAR Dataset/train/y_train.txt", 
                    header = F,  sep =";", col.names = "Activity", colClasses = "factor")
traindata <-cbind(subject_train,y_train,x_train)

#Merge test data and train data into one data set
alldata <- rbind(testdata,traindata)


## 2.Extracts only the measurements on the mean and standard deviation for each measurement
library(dplyr)
meandata <- select(alldata, contains(".mean."))
stddata <- select(alldata, contains(".std."))
otherdata <- select(alldata, matches('VolunteerID|Activity'))
selectdata <- cbind(otherdata,meandata,stddata)


## 3.Uses descriptive activity names to name the activities in the data set
selectdata$Activity <- recode(selectdata$Activity,'1'="WALKING", '2'="WALKING_UPSTAIRS", "3"="WALKING_DOWNSTAIRS", "4"="SITTING" , "5"="STANDING" , "6"="LAYING")


## 4.Appropriately labels the data set with descriptive variable names
names(selectdata) <- gsub("^t","Time",colnames(selectdata))
names(selectdata) <- gsub("^f","Frequency",colnames(selectdata))
names(selectdata) <- gsub("Acc","Acceleration",colnames(selectdata))
names(selectdata) <- gsub("Gyro","Gyroscope",colnames(selectdata))
names(selectdata) <- gsub("Mag","Magnitude",colnames(selectdata))
names(selectdata) <- gsub("BodyBody","Body",colnames(selectdata))


## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidydata <- aggregate(.~VolunteerID + Activity, selectdata, mean)
tidydata <- tidydata[order(tidydata$VolunteerID, tidydata$Activity),]
write.table(tidydata, "tidydata.csv", row.name=FALSE)


## Write cookbook
library(memisc)
Write(codebook(tidydata),"tidydatacodebook.txt")



write.table(tidydatacodebook, "tidydatacodebook.txt")
write.

str(alldata)