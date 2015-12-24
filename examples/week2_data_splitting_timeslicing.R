ibrary(caret)
library(kernlab)

# Partition email SPAM dataset into training and testing datasets
# Returns a matrix of positions of the dataset
# http://www.inside-r.org/node/87010

# Set pseudo-random seed to have reproducible results
set.seed(32243)

# Use crossvalidation to split data set into training and test.
# http://www.inside-r.org/node/87010
# createTimeSlices creates contigious training testing samples to 
# make sure that it accounts for the ordering of time.
data = 1:1000
# initialWindow is the training sample size
# followed by a 10 testing sample size which is the horizon
# This should be performed more or less equally across the dataset
# fixedWindow = TRUE is the default and it is important since it ensures that the samples are fixed and do no take the entire dataset.
slices <- createTimeSlices(y = data,initialWindow = 20,horizon = 10,fixedWindow = TRUE)

names(slices)

print(slices$train[[1]])
print(slices$test[[1]])

print(slices$train[[2]])
print(slices$test[[2]])