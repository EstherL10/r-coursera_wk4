# Getting the data
unzip(zipfile ="getdata_projectfiles_UCI HAR Dataset.zip", exdir="./data")
list.files("./data")

# defining the path where the new folder has been unziped
pathdata = file.path("./data", "UCI HAR Dataset")
# creating a file with the 28 file names
files = list.files(pathdata, recursive=TRUE)

# 1. Creating the data set of training and test
#Reading training tables - xtrain / ytrain, subject train
xtrain = read.table(file.path(pathdata, "train", "X_train.txt"),header = FALSE)
ytrain = read.table(file.path(pathdata, "train", "y_train.txt"),header = FALSE)
subject_train = read.table(file.path(pathdata, "train", "subject_train.txt"),header = FALSE)

#Reading the testing tables
xtest = read.table(file.path(pathdata, "test", "X_test.txt"),header = FALSE)
ytest = read.table(file.path(pathdata, "test", "y_test.txt"),header = FALSE)
subject_test = read.table(file.path(pathdata, "test", "subject_test.txt"),header = FALSE)

#Reading the features data
features = read.table(file.path(pathdata, "features.txt"),header = FALSE)

#Reading activity labels data
activityLabels = read.table(file.path(pathdata, "activity_labels.txt"),header = FALSE)

# creating Sanity and Column Values to the Train Data
colnames(xtrain) = features[,2]
colnames(ytrain) = "activityId"
colnames(subject_train) = "subjectId"

# creating sanity and column values to the test data
colnames(xtest) = features[,2]
colnames(ytest) = "activityId"
colnames(subject_test) = "subjectId"

# creating sanity check for the activity labels value
colnames(activityLabels) <- c('activityId','activityType')

# merging the train and test data - important outcome of the project
mrg_train = cbind(ytrain, subject_train, xtrain)
mrg_test = cbind(ytest, subject_test, xtest)

# creating the main data table merging both table tables - this is the outcome of 1
setAllInOne = rbind(mrg_train, mrg_test)


colNames = colnames(setAllInOne)

# getting a subset of all the mean and standards and the correspondongin activityID and subjectID 
mean_and_std = (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))

setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]

setWithActivityNames = merge(setForMeanAndStd, activityLabels, by='activityId', all.x=TRUE)

# creating a new tidy set
secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]

# writing the output to a txt file 
write.table(secTidySet, "secTidySet.txt", row.name=FALSE)



