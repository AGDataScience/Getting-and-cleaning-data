# Getting-and-cleaning-data

## Overview
In this repository you will find the files related to the assignment for week 4 of Getting and Cleaning Data Coursera course: 
* a code book that describes the variables, the data, and the transformations made to clean up the data called 'CodeBook.md'
* a R script called 'run_analysis.R' that generates a tidy data file.

As a prerequisite you will need to download and unzip the data file into your R working directory

## Data description
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

## Code explaination
The code combined a training dataset and a test dataset, and extracted partial variables to create another dataset with the averages of each variable for each activity.

## New dataset
The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.
The code was written based on the instruction of this assignment
0. Read the training, test dataset, variables names and subject index into R.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
