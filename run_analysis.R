# Create one R script called run_analysis.R that does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names.
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
{
 # setwd("C:\\Sanjay\\Project\\courseeraWork\\resource\\dataset")
 library(data.table)
 library(reshape2)
  {
    #Reading features and Labels
    activity <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
    features <- read.table("UCI HAR Dataset/features.txt")[,2]
 }
  # Load Train and Test Data for measurement
  {
    X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
    y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
    X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
    y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
    activityMerge <- rbind(y_train, y_test)
    colnames(activityMerge) <- 'activity'
  }
  # Read Test and Train subject Data
  {
    test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
    train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
    subjectMerge <- rbind(test_subject, train_subject)
    colnames(subjectMerge) <- 'subject'
  }
  # Merge Data 
  {
    Mergedata <-rbind(X_train,X_test)
    MeanStdData <- grepl("mean()|std()", features)
    Mergedata <- Mergedata[,MeanStdData]
    
  }
  #Label Data
  {
    CleanFeatureNames <- sapply(features, function(x) {gsub("[()]", "",x)})
    colnames(Mergedata) <- CleanFeatureNames[MeanStdData]
    
  }
  # Create Final Data and Descriptive activity names to the activities in the data set
  {
    Finaldata <- cbind(subjectMerge,activityMerge, Mergedata)
    act_group <- factor(Finaldata$activity)
    levels(act_group) <- activity
    Finaldata$activity <- act_group
  }
 # Creates a tidy data set with the average of each variable for each activity and each subject.
  
  {
    data_labels<- c("subject","activity")
    melt_data      = melt(Finaldata, id.vars =data_labels )
    TidyDataSet <- dcast(melt_data, subject + activity ~ variable, mean)
    write.table(TidyDataSet, file = "tidy_data.txt")
  }
 
}

