After download the data and unzip the file, the run_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

# Preparing the data

# Assigning data frames
features <- features.txt : 561 rows, 2 columns  
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.  
activities <- activity_labels.txt : 6 rows, 2 columns  
List of activities performed when the corresponding measurements were taken and its codes (labels)  
subject_test <- test/subject_test.txt : 2947 rows, 1 column  
contains test data of 9/30 volunteer test subjects being observed  
x_test <- test/X_test.txt : 2947 rows, 561 columns  
contains recorded features test data  
y_test <- test/y_test.txt : 2947 rows, 1 columns  
contains test data of activities’code labels  
subject_train <- test/subject_train.txt : 7352 rows, 1 column  
contains train data of 21/30 volunteer subjects being observed  
x_train <- test/X_train.txt : 7352 rows, 561 columns  
contains recorded features train data  
y_train <- test/y_train.txt : 7352 rows, 1 columns  
contains train data of activities’code labels  
  
# 1. Merging the training and test sets -> one data set  
allX (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function  
allY (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function  
allSubj (10299 rows, 1 column) is created by merging subject_train and subject_test using rbind() function  
mergedDataSet (10299 rows, 563 column) is created by merging allSubj, allY and allX using cbind() function  
  
# 2. Extracting just the mean ans sd for each measurement  
myTidy (10299 rows, 88 columns) is created by sub setting mergedDataSet, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement  
  
# 3. Naming the activities in the data set  
All numbers in code column of the myTidy was replaced with corresponding activity taken from second column of the activities variable  
  
# 4. Labeling the data set with descriptive variable names  
code column in myTidy renamed to activity  
All Acc in column’s name replaced by Accelerometer  
All Gyro in column’s name replaced by Gyroscope  
All BodyBody in column’s name replaced by Body  
All Mag in column’s name replaced by Magnitude  
All start with character f in column’s name replaced by Frequency  
All start with character t in column’s name replaced by Time  
All string "-mean()" replaced to Mean  
All string "-std()" replaced to STD  
All string "-freq()" replaced to Frequency  
Uppercase the first letter for angle and gravity  
  
All transformations done with name() function.  
  
# 5. Creating a new tidy data set with the average of each variable for each activity~subject  
myFinalTidy (180 rows, 88 columns) is created by summarizing myTidy taking the means of each variable for each activity and each subject (used list() function), after grouped by subject and activity.  
Export myFinalTidy into MyFinalTidy.txt file.  