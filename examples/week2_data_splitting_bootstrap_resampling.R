library(caret)
library(kernlab)
data(spam)

# Partition email SPAM dataset into training and testing datasets
# Returns a matrix of positions of the dataset
# http://www.inside-r.org/node/87010

# Set pseudo-random seed to have reproducible results
set.seed(32243)

# Use crossvalidation to split data set into training and test.
# http://www.inside-r.org/node/87010
# createResample creates one or more bootstrap samples
bootstrapSamples <- createResample(spam$type,times=10,list=TRUE)

print(sapply(bootstrapSamples,length))

