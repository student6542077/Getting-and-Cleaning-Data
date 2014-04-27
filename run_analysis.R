# Clear workspace
rm(list = ls())

# Assume dataset files are in "UCI HAR Dataset" directory
path_root = "UCI HAR Dataset"

# Load feature and activity names
features        = read.table(paste(path_root,  "features.txt", sep = "/"), col.names=c("id", "name"), stringsAsFactors=F)
activity_labels = read.table((paste(path_root, "activity_labels.txt", sep = "/")), col.names=c("id", "name"), stringsAsFactors=F)

# Load train files
subject_train = read.table(paste(path_root, "train", "subject_train.txt", sep = "/"), col.names=c("id"))
X_train       = read.table(paste(path_root, "train", "X_train.txt", sep = "/"),       col.names=features$name, check.names=F)
y_train       = read.table(paste(path_root, "train", "y_train.txt", sep = "/"),       col.names=c("id"))

# Load test files
subject_test  = read.table(paste(path_root, "test",  "subject_test.txt", sep = "/"),  col.names=c("id"))
X_test        = read.table(paste(path_root, "test",  "X_test.txt", sep = "/"),        col.names=features$name, check.names=F)
y_test        = read.table(paste(path_root, "test",  "y_test.txt", sep = "/"),        col.names=c("id"))

# Combine train and test data famres
# - "Merge the training and the test sets to create one data set"
subject = rbind(subject_test, subject_train)
X = rbind(X_test, X_train)
y = rbind(y_test, y_train)

# Create factor variables for subjects (30 levels) and activities (6 levels)
# - "Use descriptive activity names to name the activities in the data set"
N_subjects = max(subject$id)
activity   = factor(y$id, levels=activity_labels$id, labels=activity_labels$name)
subject_id = factor(subject$id, levels=1:N_subjects, labels=as.character(1:N_subjects))

# Filter mean() and std() measurements
# - "Extract only the measurements on the mean and standard deviation for each measurement"
mean.and.std.features.names = features$name[grep("mean\\(\\)|std\\(\\)", features$name)]
mean.and.std.X = X[, mean.and.std.features.names]

# Prepare tidy dataset with all original mean() and std() measurements
# 10299 obs. of 68 variables
# - "Appropriately label the data set with descriptive activity names"
data_all = cbind(subject_id, activity, mean.and.std.X)

# Prepare tidy dataset with all original mean() and std() measurements averaged for each actity and subject
# 180 obs. of 68 variables
# - "Create a second, independent tidy data set with the average of each variable for each activity and each subject"
data_averages = aggregate(mean.and.std.X, list(subject_id = subject_id, activity = activity), mean)

# Confirm there are no NA values and duplicate column names
any(duplicated(data_all))
any(is.na(data_all))

# Create text files
write.table(data_all,      "data_all.txt",   col.names=T, row.names=F)
write.table(data_averages, "data_averages.txt", col.names=T, row.names=F)
