

filename <- "data.zip"
if( !file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
  unzip(filename)}

#############################
####    read the data    ####
#############################

# Capture feature names
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activity_code", "activity"))

# train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",col.names = "activity_code")
train <- cbind( subject_train, X_train, y_train)

# test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_code")
test <- cbind(subject_test, X_test, y_test)

#####################
####    Tasks    ####
#####################

# 1. Merges the training and the test sets to create one data set. Check!
data <- rbind(train, test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
library(dplyr)
select_data <-  select( data, subject, activity_code, contains("mean"), contains("std"))

# 3. Uses descriptive activity names to name the activities in the data set
select_data$activity_code <- activities[select_data$activity_code, 2]

# 4. Appropriately labels the data set with descriptive variable names.
names(select_data)[2] = "activity"
names(select_data)<-gsub("Acc", "Accelerometer", names(select_data))
names(select_data)<-gsub("BodyBody", "Body", names(select_data))
names(select_data)<-gsub("Gyro", "Gyroscope", names(select_data))
names(select_data)<-gsub("Mag", "Magnitude", names(select_data))
names(select_data)<-gsub("^f", "frequencyDomainSignal", names(select_data))
names(select_data)<-gsub("^t", "time", names(select_data))
names(select_data)<-gsub("-freq()", "Frequency", names(select_data), ignore.case = TRUE)
names(select_data)<-gsub("-mean()", "Mean", names(select_data), ignore.case = TRUE)
names(select_data)<-gsub("-std()", "StandardDeviation", names(select_data), ignore.case = TRUE)


# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.

output <- select_data %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))

write.csv(output, "tidydata.csv", row.names = FALSE)