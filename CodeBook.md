Code Book for the clean data project
====================================

The first thing I did was set up a working directory. Then I added two paths(test_path,train_path) each to open test and train
folders down the line. 

Using the paths I created 6 variables with read.table. Those were test,subject_test,activity_test,
train,subject_train,activity_train which cointained the test and train datasets and their respective subjects/individuals and activities.

Then I created a variable(features) that countained all the features of the datasets. 

Using multiple grep,gsub,tolower functions I created a variable(matches) that contained all the measurment names specified in the
assignment in a little bit more descriptive manner(the final descriptive look idea is a bit vague to me so I just removed all the
"-_()"signs, elongated abbreviations, removed capital letters).

In a variable called indices I stored the column numbers of the desired mesurment columns.

Merged the two(train,test) datasets into one(merged_data) and then subsetted(using the indices variable) 
it to get only desired columns(mean_std_data) and then I added column names(from the matches variable) to get the final mean_std_data

I also merged the individuals into(merged_individuals) and activities into(merged_activity). Added them as columns to mean_std_data.

Opened data.table,reshape2 andplyr libraries.

Transformed mean_std_data into a data.table. Used a melt function on it to create a data.table(meltdata) which has the subject and
individual as id's and everything else as variables.

Finally I created a data.table(tidydata) with the dcast function so to have a mean of each measurment for each subject and their
activity as a row(ended up with a 180 rows with 81 variables dataset) 

####################To me the average of each variable means "mean" if something else
####################was supposed to be calculated then blearghhh!!!

Output the data.table as a tidydata.txt document


