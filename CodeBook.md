---
title: "CodeBook.md"
output: pdf_document
---

The studied .txt files are supposed to be placed into the working directory.

##1. Reading and modification of features.txt file.

-  The features are read and only the features containing the characters strings *"mean"* or *"std"* (standard deviation) are selected.
-  The brackets () of the features names are suppressed for simplification.

##2. Reading and modification of the training and test data files.

###2.1 Reading and modification of the *training* data files.

-  The files "subject\_train.txt" and "X\_train.txt" are read as tables. Then, we create the table X\_train\_Select which contains *only* data dealing with mean and standard deviation.
-  The columns of X_train_Select are named using the names of the selected features above.
-  The file "y\_train.txt" is read (becoming y_train table).
-  A new table, *TrainingDataSet*, is created, binding the columns (in this order): subject\_train, a vector of length the number of rows of y\_train and containing the word "TRAIN",y\_train, and X_train_Select.
- The first column of TrainingDataSet is "Subject", the second "Data_type" (here TRAIN), the third is "Activity", the next are the features selected above.
   
###2.2 Reading and modification of the *test* data files.
- The same treatment as previously is applied , using the files "subject\_test.txt", "X\_test.txt"
- We obtain a X_test_Select table, containing only variables related to "mean" and "std".
- A new table, *TesingtDataSet*, is created, binding the columns (in this order): subject\_test, a vector of length the number of rows of y\_test and containing the word "TEST",y\_test, and X\_test_Select.

##3. Merging of TrainingDataSet and TestingDataSet to create one table Final_Data.
- These two tables are merged, and the numbers correponding to Activity are replaced by the names WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING,leading to the tidy data table called *Final_Data*.

##4.Creation of an independent tidy data set with the average of each variable for each activity and each subject.
- The final table obtained is called Final\_Data_Mean.

##5. Writing Final_Data_Mean  as Tidy.txt



 



