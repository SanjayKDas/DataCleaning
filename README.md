### Introduction

This programming assignment will require  to write an R
script that is able to collect clean and write tidy data.Following
are main require functinality of this assignment

 Create one R script called run_analysis.R that does the following:
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive activity names.
 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
 The downloaded zip file contain skinny data of training and Test set. This dataset aquired during the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.Using its embedded accelerometer and gyroscope, captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

For the above purpose following step has been taken care in the script.
1. Load trainign and testing data set into table( memory)
2. Activity and feature set has been loaded
3. Merge training and testing set 
4. Label Data and provided Descriptive activity names
5. Creates a tidy data set with the average of each variable for each activity and each subject.