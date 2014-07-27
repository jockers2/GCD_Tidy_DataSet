GCD_Tidy_DataSet
================

R Project to create tidy data set from UCI HAR Dataset
(Coursera Getting and Cleaning Data Course Project1)

Usage
-----

Execute R script `run_analysis.R`

Description
-----------

Fetches UCI HAR Dataset and completes the following
operations to create a tidy data set:

1) Assigns descriptive activity names

2) Labels data set with descriptive variable names

3) Create test and train dataframes extracting only measurements
   on the mean and standard deviation
   (please see CodeBook for further ratrionale on which measurements
    were extracted)
   
4) Merges the training and test dataframes

5) Create new tidy data set with the average of each variable
   for each activity and each subject
   
6) Write the tidy data set to file

