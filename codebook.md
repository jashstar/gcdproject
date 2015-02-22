## GCD project

### Description
This file describes the variables, the data, and any transformations or work that were performed to clean up the data.

### Source data

A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
Direct link to data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 



### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


Files provided:
X_test.txt
y_test.txt' 
subject_test.txt
X_train.txt
y_train.txt
subject_train.txt
feature.txt
activitylabels.txt



### Merge the training and the test sets to create one data set.
Download the files from url provided. 
Unzip the files. 
Set the source directory for the files.
Read the following text files into tables using read.table function:
X_test.txt
y_test.txt' 
subject_test.txt
X_train.txt
y_train.txt
subject_train.txt
feature.txt
activitylabels.txt

Assign column names and merge to create one data set.

## Extract only the measurements on the mean and standard deviation for each measurement. 
Create a subset of the merged dataset that only has columns containing mean and std

## Use descriptive activity names to name the activities in the data set
Merge data subset with the 'activitytype' table to include the descriptive activity names

## Appropriately label the data set with descriptive activity names.
Use gsub function for pattern replacement to clean up the data labels.

## Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
Use ddply to genereate column wise means
