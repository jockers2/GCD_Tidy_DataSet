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
