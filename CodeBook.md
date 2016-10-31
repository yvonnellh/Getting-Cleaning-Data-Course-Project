# Procedures for" run_analysis.R" script

The script `run_analysis.R` performs 5the steps as described in the course project instructions.
* Step 1- all the similar files were read into respective tables and then using rbind to merge into 1 dataset each for test, training & features.
* Step 2- read features.txt file into table and extract the columns with mean & standard devition. THis is followed by amend the column name
* Step 3- read activity_labels.txt file into table and use it to replace column names of y_data & subject_data
* Step 4- combine the test, train & feature tables into 1 dataset.
* Step 5- compute the average data for the single data set.  Output it to a file using "write.table" command.

# Variables
* x_train - training data
* y_train - training label
* subject_train - training subject

* x_test - test data
* y_test - test label
* subject_test - test subject

* x_data - combining training and test data
* y_data - combining training and test label
* subject_data - combining training and test subject

* features - features data
* activities - descriptive activities data
* mean_and_std_features - columns with mean and standard deviation in title

* all_data - combining by column for x_data, y_data and subject_data
* averages_data - apply functions to compute the mean of all the fields in all_data
* averages_data.txt - output file as requested


