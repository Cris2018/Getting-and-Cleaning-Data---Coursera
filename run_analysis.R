# 1. Merging the training and test sets -> one data set
allX <- rbind(x_train,x_test)
allY <- rbind(y_train,y_test)
allSubj <- rbind(subject_train,subject_test)
mergedDataSet <- cbind(allSubj, allX, allY)

# 2. Extracting just the mean ans sd for each measurement
myTidy <- mergedDataSet %>% select(subject, code, contains("mean"),contains("std"))

# 3. Naming the activities in the data set
myTidy$code <- activities[myTidy$code, 2]

# 4. Labeling the data set with descriptive variable names
names(myTidy)[2] = "activity"
names(myTidy)<-gsub("Acc", "Accelerometer", names(myTidy))
names(myTidy)<-gsub("Gyro", "Gyroscope", names(myTidy))
names(myTidy)<-gsub("BodyBody", "Body", names(myTidy))
names(myTidy)<-gsub("Mag", "Magnitude", names(myTidy))
names(myTidy)<-gsub("^t", "Time", names(myTidy))
names(myTidy)<-gsub("^f", "Frequency", names(myTidy))
names(myTidy)<-gsub("tBody", "TimeBody", names(myTidy))
names(myTidy)<-gsub("-mean()", "Mean", names(myTidy), ignore.case = TRUE)
names(myTidy)<-gsub("-std()", "STD", names(myTidy), ignore.case = TRUE)
names(myTidy)<-gsub("-freq()", "Frequency", names(myTidy), ignore.case = TRUE)
names(myTidy)<-gsub("angle", "Angle", names(myTidy))
names(myTidy)<-gsub("gravity", "Gravity", names(myTidy))

# 5. Creating a new tidy data set with the average of each variable for each activity~subject
myFinalTidy <- myTidy %>% 
    group_by(subject, activity) %>% 
    summarise_all(list(mean))
write.table(myFinalTidy, "MyFinalTidy.txt", row.name = FALSE)



