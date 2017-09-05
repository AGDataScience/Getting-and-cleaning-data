rm(list = ls())

#Load the package
library(readr)
library(dplyr)
library(tidyr)

#Merge the data sets into dataset 'df' step 1 - 4

## Get the list of features 
features <- read_table("features.txt", col_names = FALSE)
features_select <- grep("(.*)mean\\(\\)|std\\(\\)(.*)", features$X1)
features_select_names <- grep("(.*)mean\\(\\)|std\\(\\)(.*)", features$X1, value = TRUE)

## Train data
x_train <- read_table("train/X_train.txt", col_names = FALSE)
x_train <- x_train[ , features_select] #select only features required
y_train <- read_table("train/y_train.txt", col_names = FALSE)
subject_train <- read_table("train/subject_train.txt", col_names = FALSE)
train_df <- cbind(subject_train, y_train, x_train)

colnames(train_df) <- c("subject_id", "activity_id", features_select_names)

    
## Test data
x_test <- read_table("test/X_test.txt", col_names = FALSE)
x_test <- x_test[ , features_select] #select only features required
y_test <- read_table("test/y_test.txt", col_names = FALSE)
subject_test <- read_table("test/subject_test.txt", col_names = FALSE)
test_df <- cbind(subject_test, y_test, x_test)

colnames(test_df) <- c("subject_id","activity_id", features_select_names)


## Merge the data
df <- rbind(train_df, test_df)


## Get the activity names
activity_labels <- read_table("activity_labels.txt", col_names = FALSE)
colnames(activity_labels) <- c("activity_id", "activity")
df <- left_join(df, activity_labels, by = "activity_id")
df <- select(df, subject_id, activity, everything(), -activity_id) #reorder the columns


# Creation of a tidy dataset with the average of each variable for each activity and each subject
df2 <- df %>%
    gather(key = "variable", value = "value", -c(subject_id, activity)) %>%
    group_by(subject_id, activity, variable) %>%
    summarise(mean = mean(value)) %>%
    spread(key = "variable", value = "mean")

#Write the data file
write.table(df2, file = "tidydata.txt", row.name=FALSE)
