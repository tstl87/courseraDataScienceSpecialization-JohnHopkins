# Coursera Project: "Getting and Cleaning Data"

This is my course project for the Getting and Cleaning Data couurse in the Data Science specialization project by John Hopkins. In this repository you will find an R script called `run_analysis.R` which does the following

1. Downloads the zipped data and unpacks it.
2. Reads and merges the data from `X_train.txt`, `X_test.txt`, `y_train.txt`, `y_test.txt`, `subject_train.txt`, `subject_test.txt`, and assigns the names to the features from `features.txt`
3. From the data, the script selects all feature names which contains "mean" and "std".
4. Maps the activity code number to the name of the activity in the activity column.
5. Renames the columns of the data to a more descriptive with the hope that a codebook won't need to be referred to as often.
6. Groups the data by subject and activity and then computes the mean.
7. outputs the data to file `tidydata.csv`