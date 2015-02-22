#Following are the steps to be followed to analyse the dataset:
## Initial steps
testdata <- read.table("C:/Users/Sony/Documents/R/dataforproject/UCI HAR Dataset/test/X_test.txt")
traindata <- read.table("C:/Users/Sony/Documents/R/dataforproject/UCI HAR Dataset/train/X_train.txt")

trainlabel <- read.table("C:/Users/Sony/Documents/R/dataforproject/UCI HAR Dataset/train/y_train.txt")
testlabel <- read.table("C:/Users/Sony/Documents/R/dataforproject/UCI HAR Dataset/test/y_test.txt")

subjecttrain <- read.table("C:/Users/Sony/Documents/R/dataforproject/UCI HAR Dataset/train/subject_train.txt")
subjecttest <- read.table("C:/Users/Sony/Documents/R/dataforproject/UCI HAR Dataset/test/subject_test.txt")

features <- read.table("C:/Users/sony/Documents/R/dataforproject/UCI HAR Dataset/features.txt")
activitylabel <- read.table("C:/Users/Sony/Documents/R/dataforproject/UCI HAR Dataset/activity_labels.txt")

colnames(traindata) = features[, 2]
colnames(testdata) = features[,2]

colnames(subjecttrain)="subject Id"
colnames(subjecttest)="subject Id"

colnames(testlabel)="activity Id"
colnames(trainlabel)="activity Id"
colnames(activitylabel) = c('activity Id', 'activity')

combinedtest <- cbind(testdata, testlabel, subjecttest)
combinedtrain <- cbind(traindata, trainlabel, subjecttrain)

#Merges the training and the test sets to create one data set.
finaldata <- rbind(combinedtest, combinedtrain)

#Extracts only the measurements on the mean and standard deviation for each measurement.
finaldata_mean_std <- finaldata[,grepl("mean|std|subject Id|activity Id", names(finaldata))]

#Uses descriptive activity names to name the activities in the data set
finaldata_mean_std <- join(finaldata_mean_std, activitylabel, by="activity Id", match="first")


#Appropriately labels the data set with descriptive variable names
##Identify and replace slash using grep/gsub
names(finaldata_mean_std) <- gsub('\\(|\\)',"",names(finaldata_mean_std), perl = TRUE)
names(finaldata_mean_std) <- make.names(names(finaldata_mean_std))

## Full form of short names using gsub (find short name and then replace with full form)
names(finaldata_mean_std) <- gsub('Acc',"Acceleration",names(finaldata_mean_std))
names(finaldata_mean_std) <- gsub('GyroJerk',"AngularAcceleration",names(finaldata_mean_std))
names(finaldata_mean_std) <- gsub('Gyro',"AngularSpeed",names(finaldata_mean_std))
names(finaldata_mean_std) <- gsub('Mag',"Magnitude",names(finaldata_mean_std))
names(finaldata_mean_std) <- gsub('^t',"TimeDomain.",names(finaldata_mean_std))
names(finaldata_mean_std) <- gsub('^f',"FrequencyDomain.",names(finaldata_mean_std))
names(finaldata_mean_std) <- gsub('\\.mean',".Mean",names(finaldata_mean_std))
names(finaldata_mean_std) <- gsub('\\.std',".StandardDeviation",names(finaldata_mean_std))
names(finaldata_mean_std) <- gsub('Freq\\.',"Frequency.",names(finaldata_mean_std))
names(finaldata_mean_std) <- gsub('Freq$',"Frequency",names(finaldata_mean_std))

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
finaltidydata = ddply(finaldata_mean_std, c("subject.Id","activity"), numcolwise(mean))

# Please upload your data set as a txt file created with write.table() using row.name=FALSE
write.table(finaltidydata, row.name=FALSE, file = "finaltidydata.txt")
