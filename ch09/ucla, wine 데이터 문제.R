1. ucla 데이터  4가지 모델(dt, rf, svm, knn) 에 대해 모델링, 예측, 평가
2. wine 데이터   


1.
library(rpart)
library(caret)
library(e1071)
rpart.plot(dtc)
# dt
ucla <- read.csv('https://stats.idre.ucla.edu/stat/data/binary.csv')
ucla
ucla$admit <- factor(ucla$admit)

set.seed(2021)
ucla_index <- sample(1:nrow(ucla), 0.8*nrow(ucla))
ucla_train <- ucla[ucla_index, ]
ucla_test <- ucla[-ucla_index, ]

dtc <- rpart(admit ~ ., data=ucla_train)

pred <- predict(dtc, data=ucla_test, type='class')
pred
pred <- predict(dtc_ucla, ucla, type='class')

confusionMatrix(pred, ucla_test$admit)

confusionMatrix(pred, ucla_test$admit)


r <- rpart(admit ~., data=ucla)
par(mfrow=c(1,1), xpd=NA)
plot(r)
text(r, use.n=T)
p <- predict(r, ucla, type='class')
table(p, ucla$admit)

library(rpart.plot)
rpart.plot(r)
rpart.plot(r, type=4)

# rf
library(randomForest)
f <- randomForest(admit ~., data=ucla)
f

set.seed(2021)
train_index <- createDataPartition(ucla$admit, p=0.8, list=F)
ucla_train <- ucla[train_index, ]
ucla_test <- ucla[-train_index, ]


rf <- randomForest(admit ~ ., ucla_train)
rf

pred <- predict(rf, ucla_test, type='class')
pred

confusionMatrix(pred, ucla_test$admit)

# svm
train_index <- createDataPartition(ucla$admit, p=0.8, list=F)
ucla_train <- ucla[train_index, ]
ucla_test <- ucla[-train_index, ]


svc <- svm(admit ~ ., ucla_train)
pred <- predict(svc, ucla_test, type='class')
confusionMatrix(pred, ucla_test$admit)

# k-nn
k <- knn(ucla_train[, 1:4], ucla_test[, 1:4], ucla_train$admit)
k
ucla_test$admit
confusionMatrix(k, ucla_test$admit)





2. 
getwd()
setwd('C:/workspace/R/data')
wine <- read.table('wine.data.txt', header=F, sep = ",")
head(wine)

n <- readLines('wine.name.txt')
n

names(wine)[2:14] <- substr(n, 4, nchar(n))
names(wine)

wine
wine$Alcohol <- factor(wine$Alcohol)
dtc <- rpart(Alcohol ~ ., data=wine)
par(mfrow=c(1,1), xpd=NA)
plot(dtc)
text(dtc, use.n=T)

pred <- predict(dtc, wine, type='class')
confusionMatrix(pred, wine$Alcohol)

set.seed(2021)
train_index <- createDataPartition(wine$Alcohol, p=0.8, list=F)
wine_train <- wine[train_index, ]
wine_test <- wine[-train_index, ]

rf <- randomForest(Alcohol ~ ., wine_train)

library(dplyr)
train_set <- sample_frac(wine, 0.6)
str(train_set)
test_set <- setdiff(wine, train_set)
str(train_set)
