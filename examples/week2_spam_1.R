library(caret)
library(kernlab)
data(spam)

# Partition email SPAM dataset into training and testing datasets
# Returns a matrix of positions of the dataset
# http://www.inside-r.org/node/87010
inTrain <- createDataPartition(y=spam$type,p=0.75,list=FALSE)

# Assign the datasets to appropriate variables
# Why do I need the `,` after the matrix to 
training <- spam[inTrain,]
testing <- spam[-inTrain,]

# Dimensions of training set
dim(training)

# Set pseudo-random seed to have reproducible results
set.seed(32243)

# Fit a model
# glm = *Generalized Linear Model*
# List of algorithms available [here](http://topepo.github.io/caret/modelList.html)
modelFit <- train(type ~., data=training, method="glm")
print(modelFit)

# Use the fitted model to predict the type of the testing data.
# http://www.inside-r.org/r-doc/stats/predict
predictions <- predict(modelFit, newdata=testing)
print(predictions)