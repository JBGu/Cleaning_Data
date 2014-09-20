#The feature.txt table is read and features related to mean and standard deviation are selected 
# Signs such as () are removed from the features names.
FeaturesNames <- read.table("features.txt")
FeaturesSelect<-with(FeaturesNames, FeaturesNames[grepl("mean",V2) | grepl("std",V2),])
FeaturesSelect$V2 <- gsub("()","",FeaturesSelect$V2,fixed=TRUE)

#Reading and analysing the training data files
subject_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt")

# In, the X_train table, selection of feature variables concerning only mean or standard deviation
X_train_Select <- X_train[,FeaturesSelect$V1]

# The selected features names are attributed to the columns of X_train_Select
names(X_train_Select) <- FeaturesSelect$V2 

y_train <- read.table("y_train.txt")


c<-rep("TRAIN",nrow(y_train))

TrainingDataSet<-cbind(subject_train, c,y_train,X_train_Select)
colnames(TrainingDataSet)[1]<-"Subject"
colnames(TrainingDataSet)[2]<-"Data_type"
colnames(TrainingDataSet)[3] <-"Activity"


#The same thing is done with the test files

subject_test <- read.table("subject_test.txt")
X_test <- read.table("X_test.txt")
X_test_Select <- X_test[,FeaturesSelect$V1]

names(X_test_Select) <- FeaturesSelect$V2 

y_test <- read.table("y_test.txt")

c<-rep("TEST",nrow(subject_test))
TestingDataSet <- cbind(subject_test,c, y_test,X_test_Select)
colnames(TestingDataSet)[1] <-"Subject"
colnames(TestingDataSet)[2] <-"Data_type"
colnames(TestingDataSet)[3] <-"Activity"

# TrainingDataSet table and TestingDataSet are merged
Final_Data<-rbind(TrainingDataSet,TestingDataSet)

#Replace the number corresponding to an activity by its name
Final_Data$Activity <- as.factor(Final_Data$Activity)
levels(Final_Data$Activity) <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

#Creation of an independent tidy data set with the average of each variable for each activity and each subject.
Final_Data_Mean<- aggregate(. ~ Subject + Activity, data=Final_Data, FUN = mean)

#Writing last as Tidy.txt
write.table(Final_Data_Mean, file="Tidy.txt", row.names=FALSE)
