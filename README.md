Clean_Data
==========
run_analysis.R is an R-script the needs to be opened in the \UCI HAR Dataset\ to work.

It opens all the necessary files:

- 'features.txt'

- 'activity_labels.txt'

- 'X_train.txt': Training set.

- 'y_train.txt': Training labels.

- 'X_test.txt': Test set.

- 'y_test.txt': Test labels.

- 'subject_test.txt'

- 'subject_train.txt'

Merges the two datasets(X_train,X_test), cleans up the data, adds activity labels and subjects,selects only for mean and standard deviation of features and in the end outputs a tidy data set of subjects, their activities and the average value of each of the measurments for the subject/activity pair in tidydata.txt file.


run_analysis.R and its variables are described in more detail in the CodeBook.md as per exam instructions.

