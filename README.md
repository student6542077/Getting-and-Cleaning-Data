Tidy data set for Human Activity Recognition Using Smartphones project
======================================================================

The purpose of this project is to tidy the data set from Human Activity Recognition Using Smartphones web page:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Direct link to the zip file is <http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip>


# How to run the script

 1. Download run_analysis.R script
 2. Make sure the current R working directory is the one containing the script
 3. Unzip UCI data set file to this directory
 4. Run run_analysis.R
 5. Find data\_all.txt and data\_averages.txt files in the working directory

# Description of the generated files

Below a short description of the generated files is given. Extended description is given in a separate file Codebook.md

## Generated file data_all.txt

data_all.txt is a space delimited table text file with column names in the first line. 

The first two columns contain subject id and activity name. The other columns contain sampled raw and filtered 
accelerometer and gyroscope measuments. See <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> for details. 
The data set contains union of training and test data from the source web page. 

Please, see Codebook.md for the complete list of measurements. 

## Generated file data_averages.txt

data_averages.txt is a space delimited table text file with column names in the first line. 

The first two columns contain subject id and activity name. The other columns contain measurements from 
data_all.txt averaged for each subject and activity. 

Please, see Codebook.md for the complete list of measurements. 
