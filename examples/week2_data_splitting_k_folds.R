library(caret)
library(kernlab)
data(spam)

# Partition email SPAM dataset into training and testing datasets
# Returns a matrix of positions of the dataset
# http://www.inside-r.org/node/87010

# Set pseudo-random seed to have reproducible results
set.seed(32243)

# Use crossvalidation to split data set into training and test.
trainingFolds <- createFolds(spam$type,k=10,list=TRUE,returnTrain=TRUE)
testingFolds <- createFolds(spam$type,k=10,list=TRUE, returnTrain=FALSE)

print(sapply(trainingFolds,length))
print(sapply(testingFolds,length))
