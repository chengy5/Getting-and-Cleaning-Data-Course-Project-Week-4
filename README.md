# Getting-and-Cleaning-Data-Course-Project-Week-4

## Step1.Merges the training and the test sets to create one data set
-Down load and unzip file 
-Read features data
-Read test data and merge test data into one data set
-Read train data and merge train data into one data set
-Merge test data and train data into one data set

## Step2.Extracts only the measurements on the mean and standard deviation for each measurement
-Apply the function of "select" in package "dplyr" to extracts the measurements on the mean and standard deviation

## Step3.Uses descriptive activity names to name the activities in the data set
-Apply the function of "recode" in package "dplyr" to extracts the measurements on the mean and standard deviation

## Step4.Appropriately labels the data set with descriptive variable names
-Apply the function of "gsub" to rename the variable names

## Step5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
-Apply the function of {aggregate} to produce tidy data set

## Creat codebook
-Apply the function of "codebook" in package "memisc" to creat codebook
