## run_analysis.R

## check for local copy of file and download if required

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
localFilename <- "UCI_HAR_Data.zip"

if (!file.exists(localFilename)) {
    print("Fetching data set from URL...")
    download.file(fileUrl, destfile = localFilename, mode = "wb")
} else {
    print("Using local copy of data set")
}

dataFileList <- unzip(localFilename,list = TRUE)

## unzip data files to ./data directory (if not already done)

if (!file.exists("data")) {  
  unzip(localFilename, overwrite=FALSE, exdir="data")
}

## read data files that include the descriptive labels for activity
## code and labels for all the measurement vectors

activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt",
                              sep = " ", header=FALSE)
features <- read.table("./data/UCI HAR Dataset/features.txt", sep = " ",
                       header=FALSE)

colnames(activity_labels) <- c("ID","Activity")

## read training data set and test data set if they do not already
## exist in the environment (this saves a lot of time debugging)

inFiles <- matrix(c("subject_train","./data/UCI HAR Dataset/train/subject_train.txt",
                     "X_train_data", "./data/UCI HAR Dataset/train/X_train.txt",
                     "y_train_levels", "./data/UCI HAR Dataset/train/y_train.txt",
                     "subject_test","./data/UCI HAR Dataset/test/subject_test.txt",
                     "X_test_data","./data/UCI HAR Dataset/test/X_test.txt",
                     "y_test_levels","./data/UCI HAR Dataset/test/y_test.txt"),
                     ncol = 2, byrow = TRUE)
colnames(inFiles) <- c("DataObject","FileLoc")

for (i in 1:nrow(inFiles)) {
    if (!exists(inFiles[i,1])) {
        print(paste("reading data from file for", inFiles[i,1]))
        assign(inFiles[i,1], read.table(inFiles[i,2],header=FALSE))
    }
}

## label columns and assign factors to Activity column

colnames(X_train_data) <- features[,2]
colnames(X_test_data) <- features[,2]

colnames(subject_train) <- "Subject"
colnames(subject_test) <- "Subject"

y_train_labels <- as.matrix(factor(y_train_levels[,1], levels=activity_labels$ID, labels=activity_labels$Activity))
colnames(y_train_labels) <- "Activity"

y_test_labels <- as.matrix(factor(y_test_levels[,1], levels=activity_labels$ID, labels=activity_labels$Activity))
colnames(y_test_labels) <- "Activity"

## find indices of columns with mean or standard deviation measurements

indx_means <- grep("-mean\\(\\)",features[,2])
indx_stds <- grep("-std\\(\\)",features[,2])
indices <- sort(c(indx_means,indx_stds))

## create dataframe including training data

df_train <- data.frame(X_train_data[,indices])
colnames(df_train) <- features[indices,2]
df_train <- cbind(subject_train, y_train_labels, df_train)

## create dataframe including test data 

df_test <- data.frame(X_test_data[,indices])
colnames(df_test) <- features[indices,2]
df_test <- cbind(subject_test, y_test_labels, df_test)

## 'merge' train and test dataframes

df_merged <- rbind(df_train, df_test)

## second (tidy**) data set with average of each variable for each
## activity and each subject. Uses plyr package and sorts by Subject
##
## ** each variable in one column
## ** each observation in different row
## ** one table for each "kind" of variable
## ** multiple tables should each include a column to link tables

library(plyr)
tidySummary <- ddply(df_merged, c("Subject","Activity"), function(df)colMeans(df[,3:ncol(df_merged)]) )
arrange(tidySummary,Subject,Activity)

## write tidy Summary to file

write.table(tidySummary,"UCI_HAR_Tidy_Summary.txt")