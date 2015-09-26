
##Course number: getdata-032, 9/23/2015
# Course Project:
# You should create one R script called run_analysis.R that does the following. 
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.From the data set in step 4, creates a second, independent tidy data set with the average 
#   of each variable for each activity and each subject.



## 1. Merges the training and the test sets to create one data set.
# dir = "UCI HAR Dataset/"


install.packages("dplyr")
library(data.table)
library(plyr)
#library(dplyr)             #which has select package

###setwd("~/coursera_3_4/Getting_Cleaning_Data/")   

dirTrain <- "UCI HAR Dataset/train/"              
dirTest <- "UCI HAR Dataset/test/"

#full.name = TRUE -- the directory path is prepended to the file names
files <- list.files(dirTrain, pattern="X_train.txt", full.names = TRUE)
files[2] <- list.files(dirTest, pattern="X_test.txt", full.names = TRUE)
allData <- do.call(rbind, lapply(files, read.table)) 

# checking the data
dim(allData)
head(allData)
names(allData)

# another way to do it, but need to rm the temp files after merge
trainyLabel <- read.table("UCI HAR Dataset/train/Y_train.txt")
testyLabel <- read.table("UCI HAR Dataset/test/Y_test.txt")
allyLabels <- rbind(trainyLabel, testyLabel)
#head(allyLabels,60)

# merge subjecs
trainySubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
allSubjects <- rbind(trainySubject, testSubject)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# clean up variable names in features.txt(column names) which has (), "-" and ",".
varNames <- read.table("UCI HAR Dataset/features.txt")
varNames <- gsub("[(),-]", "", varNames[,2])
head(varNames)
length(varNames)  #561

# attach variable names to the merged data
names(allData) <- varNames
head(allData,3)
dim(allData)      #10299, 561

selectedCols <- grep("Mean|mean|std", varNames)

#selectedData <- select(allData, contains("mean|Mean|std", ignore.case = TRUE))  # dup names
selectedData <- allData[, selectedCols]
head(selectedData)

## 3. Uses descriptive activity names to name the activities in the data set

activityTemp <- read.table("UCI HAR Dataset/activity_labels.txt")
head(activityTemp)    
activityLabels <- as.character(activityTemp[,2])
head(activityLabels)   #which has two cols. only 6 elements

#clean up "_" in the labels 
activityLabels <-gsub("_", "", activityLabels, fixed = TRUE)
head(activityLabels)


## 4. Appropriately labels the data set with descriptive variable names.
#replace defalt variable names V1/V1 to "activity" and" subject"
names(allyLabels) <- "activity"
names(allSubjects) <- "subjectid"
mergedData <- cbind(allSubjects, allyLabels, selectedData)

# debug
#names(mergedData)
#head(mergedData, 2)
#dim(mergedData)   #10299,86+2 new

# to replace activity from numbers to meaningful labels
for (ii in 1:6) {
   mergedData$activity[mergedData$activity == ii] <- activityLabels[ii]
}

names(mergedData) <- tolower(names(mergedData))
write.table(mergedData, "tidy_data.txt",row.names = FALSE)

## 5. From the data set in step 4, creates a second, independent tidy 
##    data set with the average of each variable for each activity and each subject.
notToCal <- c(1,2)
final <- ddply(mergedData, .(subjectid, activity), .fun=function(x){ colMeans(x[,-notToCal]) })
dim(final)

# use lower case for all variable names
names(final) <- tolower(names(final))
write.table(final, "tidy_data_mean_std.txt", row.names = FALSE)
