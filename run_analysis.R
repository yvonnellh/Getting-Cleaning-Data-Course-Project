library(plyr)

# Step 1 - Merge the training and test sets to create one data set
#---------
  x_train <- read.table("C:/data/UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("c:/data/UCI HAR Dataset/train/y_train.txt")
  subject_train <- read.table("c:/data/UCI HAR Dataset/train/subject_train.txt")
  
  x_test <- read.table("c:/data/UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("c:/data/UCI HAR Dataset/test/y_test.txt")
  subject_test <- read.table("c:/data/UCI HAR Dataset/test/subject_test.txt")
  
  # combine data sets
  x_data <- rbind(x_train, x_test)
  y_data <- rbind(y_train, y_test)
  subject_data <- rbind(subject_train, subject_test)

# Step 2 - Extract only the measurements on the mean and standard deviation for each measurement
#--------- 
  features <- read.table("c:/data/UCI HAR Dataset/features.txt")
  
# get columns with mean() or std() in their names
  mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
  
# subset the columns for mean() & std()
  x_data <- x_data[, mean_and_std_features]
  

# Step 3 - Use descriptive activity names to name the activities in the data set
#-------
  activities <- read.table("c:/data/UCI HAR Dataset/activity_labels.txt")
  
# update values with correct activity names
  y_data[, 1] <- activities[y_data[, 1], 2]
  
  
# Step 4 - Appropriately label the data set with descriptive variable names
#---------

# amend the column names for x_data, y_data and subject_data
  names(x_data) <- features[mean_and_std_features, 2]
  names(y_data) <- "activity"
  names(subject_data) <- "subject"
  
# Step 5 - Create a second, independent tidy data set with the average of each variable
#          for each activity and each subject
#---------
# finding average data for 1:65, but columns 66-68 (last two) are (activity & subject)
# bind all the data in a single data set
  all_data <- cbind(x_data, y_data, subject_data)
  averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
  write.table(averages_data, "averages_data.txt", row.name=FALSE)
  