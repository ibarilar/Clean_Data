
#specifying working directory and paths to folders containing files of interest
#setwd("C:/Users/Ivan/Desktop/R_EXAMS/Clean_Data/UCI HAR Dataset") -according to online instructions this isnt needed
#since it should be run from the UCI HAR Dataset as a default working directory 
test_path <- "test"
train_path <- "train"
#reading all the necessary files(data files, description files, activity files,individual files)
require("data.table")
test <- read.table(file.path(test_path,"X_test.txt"))
subject_test <- read.table(file.path(test_path,"subject_test.txt"))
activity_test <- read.table(file.path(test_path,"y_test.txt"))
train <- read.table(file.path(train_path,"X_train.txt"))
subject_train <- read.table(file.path(train_path,"subject_train.txt"))
activity_train <- read.table(file.path(train_path,"y_train.txt"))
features <- read.table("features.txt")
#forming vectors with the tidy(more or less) column names for mean and standard deviation values
matches <- c("mean", "std")
matches <- unique (grep(paste(matches,collapse="|"), 
                        features[,2], value=TRUE))
matches <- tolower(gsub("()-","",matches))
matches <- gsub("[Aa]cc","acceleration",matches)
matches <- gsub("^t","time",matches)
matches <- gsub("^f","frequency",matches)
matches <- gsub("[Mm]ag","magnitude",matches)
matches <- gsub("std","standarddeviation",matches)
matches <- gsub("\\(\\)","",matches) 
indices <- grep("mean|std",features[,2])
#merging the two data sets into one and adding column names
merged_data <- merge(test,train, all=TRUE)
mean_std_data <- subset(merged_data,select=c(indices))
colnames(mean_std_data) <- matches
#adding individual and activity columns to the dataset
merged_individuals <- rbind(subject_test,subject_train)
merged_activity <- rbind(activity_test,activity_train)
replacement <- c("walking","walkingupstairs","walkingdownstairs","sitting","standing","laying")
merged_activity[1:10299,1] <-replacement[merged_activity[1:10299,1]]
mean_std_data$subject <- merged_individuals$V1
mean_std_data$activity <- merged_activity$V1
#reshaping data to make the tidy dataset
library(reshape2)
library(plyr)
mean_std_data <- data.table(mean_std_data)                                
meltdata<-melt(mean_std_data,id=c("subject","activity"),measure.vars=matches)
tidydata <- dcast(meltdata,subject+activity~variable,mean)
write.table(tidydata,file="tidydata.txt")


