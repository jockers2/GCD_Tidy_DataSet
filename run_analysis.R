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

trainFiles <- matrix(c("subject_train","./data/UCI HAR Dataset/train/subject_train.txt",
                       "X_train_data", "./data/UCI HAR Dataset/train/X_train.txt",
                       "y_train_levels", "./data/UCI HAR Dataset/train/y_train.txt"),
                     ncol = 2, byrow = TRUE)
colnames(trainFiles) <- c("DataObject","FileLoc")

for (i in 1:nrow(trainFiles)) {
    if (!exists(trainFiles[i,1])) {
        assign(trainFiles[i,1], read.table(trainFiles[i,2],header=FALSE))
    }
}

## label columns

colnames(X_train_data) <- features[,2]
colnames(subject_train) <- "Subject"
y_train_labels <- as.matrix(factor(y_train_levels[,1], levels=activity_labels$ID, labels=activity_labels$Activity))
colnames(y_train_labels) <- "Activity"

## find indices of columns with mean or standard deviation measurements

train_means <- grep("mean()",features[,2])
train_stds <- grep("std()",features[,2])
train_indices <- sort(c(train_means,train_stds))

## create dataframe including training data

df_train <- data.frame(X_train_data[,train_indices])
colnames(df_train) <- features[train_indices,2]
df_train <- cbind(subject_train, y_train_labels, df_train)



