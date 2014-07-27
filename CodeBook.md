GCD_Tidy_DataSet
================

Study Design
------------

This project did not involve completing a study design, rather
a publicly available data set was used to practice techniques
for getting and cleaning data. The data set include time and
frequency domain measurements of filtered accelerometer and
gyroscope (3 axes each) data measured with a smartphone worn
by 30 subjects and performing activities fitting six categories.
For further details on how the raw data was filtered, see the
file `features_info.txt` archived within the UCI HAR Dataset. 

Code Book - UCI_HAR_Tidy_Summary.txt
------------------------------------

Space delimited.
181 lines (1 header + 180 data rows). 68 columns/variables:

1. Subject  (Ordinal 1:30)
    Subject ID
        
2. Activity (Categorical)
    Activity Labels
        WALKING
        WALKING_UPSTAIRS
        WALKING_DOWNSTAIRS
        SITTING
        STANDING
        LAYING

Columns 3 thru 32: (Continuous [-1,1])
    Five groups of six time domain summary values (three mean
    of measurements in X, Y, Z axes followed by three standard
    deviations of measurements in X, Y Z axes) 
    for the following measurements:
        Body Acceleration
        Gravity Acceleration
        Body Acceleration Jerk
        Body Gyroscope
        Body Gyroscope Jerk
  
3. tBodyAcc-mean()-X 
4. tBodyAcc-mean()-Y 
5. tBodyAcc-mean()-Z 
6. tBodyAcc-std()-X 
7. tBodyAcc-std()-Y 
8. tBodyAcc-std()-Z 
9. tGravityAcc-mean()-X 
10. tGravityAcc-mean()-Y 
11. tGravityAcc-mean()-Z 
12. tGravityAcc-std()-X 
13. tGravityAcc-std()-Y 
14. tGravityAcc-std()-Z 
15. tBodyAccJerk-mean()-X 
16. tBodyAccJerk-mean()-Y 
17. tBodyAccJerk-mean()-Z 
18. tBodyAccJerk-std()-X 
19. tBodyAccJerk-std()-Y 
20. tBodyAccJerk-std()-Z 
21. tBodyGyro-mean()-X 
22. tBodyGyro-mean()-Y 
23. tBodyGyro-mean()-Z 
24. tBodyGyro-std()-X 
25. tBodyGyro-std()-Y 
26. tBodyGyro-std()-Z 
27. tBodyGyroJerk-mean()-X 
28. tBodyGyroJerk-mean()-Y 
29. tBodyGyroJerk-mean()-Z 
30. tBodyGyroJerk-std()-X 
31. tBodyGyroJerk-std()-Y 
32. tBodyGyroJerk-std()-Z 

Columns 33 thru 42: (Continuous [-1,1])
    Five groups of two time domain summary values (mean &
    standard deviation) where the X, Y, Z values of the
    measurements in columns 3 thru 32 have been combined
    (presumably RSS) into magnitudes

33. tBodyAccMag-mean() 
34. tBodyAccMag-std() 
35. tGravityAccMag-mean() 
36. tGravityAccMag-std() 
37. tBodyAccJerkMag-mean() 
38. tBodyAccJerkMag-std() 
39. tBodyGyroMag-mean() 
40. tBodyGyroMag-std() 
41. tBodyGyroJerkMag-mean() 
42. tBodyGyroJerkMag-std() 

Columns 43 thru 60: (Continuous [-1,1])
    Three groups of six frequency domain summary values (three mean
    of measurements in X, Y, Z axes followed by three standard
    deviations of measurements in X, Y Z axes) 
    for the following measurements:
        Body Acceleration
        Body Acceleration Jerk
        Body Gyroscope
    NOTE: a fourth group of measurements for BodyGyroJerk is presumed
          missing from the archived dataset as the magnitude does
          appear in the next group
    
43. fBodyAcc-mean()-X 
44. fBodyAcc-mean()-Y 
45. fBodyAcc-mean()-Z 
46. fBodyAcc-std()-X 
47. fBodyAcc-std()-Y 
48. fBodyAcc-std()-Z 
49. fBodyAccJerk-mean()-X 
50. fBodyAccJerk-mean()-Y 
51. fBodyAccJerk-mean()-Z 
52. fBodyAccJerk-std()-X 
53. fBodyAccJerk-std()-Y 
54. fBodyAccJerk-std()-Z 
55. fBodyGyro-mean()-X 
56. fBodyGyro-mean()-Y 
57. fBodyGyro-mean()-Z 
58. fBodyGyro-std()-X 
59. fBodyGyro-std()-Y 
60. fBodyGyro-std()-Z

Columns 61 thru 68: (Continuous [-1,1])
    Four groups of two time domain summary values (mean &
    standard deviation) where the X, Y, Z values of the
    measurements in columns 3 thru 32 have been combined
    (presumably RSS) into magnitudes

61. fBodyAccMag-mean() 
62. fBodyAccMag-std() 
63. fBodyBodyAccJerkMag-mean() 
64. fBodyBodyAccJerkMag-std() 
65. fBodyBodyGyroMag-mean() 
66. fBodyBodyGyroMag-std() 
67. fBodyBodyGyroJerkMag-mean() 
68. fBodyBodyGyroJerkMag-std() 


Remarks
-------

The test and training dataset includes 561 variables/columns, most of them were
discarded per the request to include only the mean and standard deviation results
in the tidy summary. That leaves 68 columns of variables in the tidy summary:
2x factors (Subject & Activity) = 2
5x time domain accel & gyro measurements in X, Y, Z (x2 for mean + std) = 30 columns
5x time domain accel & gyro magnitude (x2 for mean + std) = 10 columns
3x frequency domain accel & gyro measurements in X, Y, Z (x2 for mean + std) = 18 columns
4x frequency domain accel & gyro magnitude (x2 for mean + std) = 8 columns

2 + 30 + 10 + 18 + 8 = 68 columns total

Note that the angle() column was discarded, therefore the five additional vectors
included in the original dataset and referred to near the end of `features_info.txt`
with 'Mean' in the name that are used on the angle() variable were also discarded.

Reference
---------

[UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
