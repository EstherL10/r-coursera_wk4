# R Assignment week 4
Getting and Cleaning Data in R

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis. To action the code follow these steps:
1) Download and unzip the data file into your own R working directory, the file can be obtained <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">here:</a>
2) Download the R source code into your R working directory, and 
3) Execute the code to generate a tidy and clean data set.

## Data description
The variables in the data X are sensor-signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

## Code explanation
The code combines training and test datasets, and extracted partial variables to create another dataset with the averages of each variable for each activity.

## New Dataset 
The new dataset containes variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.

# Instruction provided for this assignment
Write a code that performs the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
