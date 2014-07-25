## run_analysis.R

## Course Project for Coursera "Getting & Cleaning Data"

## fetches UCI HAR Dataset (if necessary) and completes the following
## operations to create a tidy data set:
##
## 1) Merges the training and test sets
## 2) Extracts only measurements on the mean and standard deviation
## 3) Assigns descriptive activity names
## 4) Labels data set with descriptive variable names
## 5) Create new tidy data set with the average of each variable
##    for each activity and each subject

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
localFilename <- "UCI_HAR_Data.zip"

if (!file.exists(localFilename)) {
    print("Fetching data set from URL...")
    download.file(fileUrl, destfile = localFilename, mode = "wb")
} else {
    print("Using local copy of data set")
}

dataFileList <- unzip(localFilename,list = TRUE)

if (!file.exists("data")) {  
  unzip(localFilename, overwrite=FALSE, exdir="data")
}

## start reading data

activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", sep = " ", header=FALSE)
features <- read.table("./data/UCI HAR Dataset/features.txt", sep = " ", header=FALSE)

colnames(activity_labels) <- c("ID","Activity")

## read training data set

subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", sep = " ", header=FALSE)
if (!exists("X_train_data")) {
  X_train_data <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header=FALSE)
}
y_train_labels <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header=FALSE)

colnames(X_train_data) <- features[,2]
colnames(subject_train) <- "Subject"
colnames(y_train_labels) <- c("Activity")
foobar <- factor(y_train_labels, levels=activity_labels$ID, labels=activity_labels$Activity)

## find indices of columns with mean or standard deviation measurements

train_means <- grep("mean()",features[,2])
train_stds <- grep("std()",features[,2])
train_indices <- sort(c(train_means,train_stds))


