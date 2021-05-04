library(survival)
library(caret)
library(rpart)
library(randomForest)
library(e1071)
library(class)

str(colon)
clean_colon <- na.omit(colon)
clean_colon <- clean_colon[c(T, F), ]
clean_colon$status <- factor(clean_colon$status)



set.seed(2021)
train_index <- createDataPartition(clean_colon$status, p=0.8, list=F)
clean_colon_train <- clean_colon[train_index, ]
clean_colon_test <- clean_colon[-train_index, ]

rf <- randomForest(status ~ ., clean_colon_train)
rf_pred <- predict(rf, clean_colon_test, type='class')
t <- table(rf_pred, clean_colon_test$status)
t
rf_acc <- (t[1,1] + t[2,2]) / nrow(clean_colon_test)
rf_acc


# k = 5
control <- trainControl(method='cv', number=5)
new_rf <- train(status ~ ., clean_colon, method='rf', 
                metric='Accuracy', trControl=control)
confusionMatrix(new_rf)

# k = 10
control <- trainControl(method='cv', number=10)
new_rf <- train(status ~ ., clean_colon, method='rf', 
                metric='Accuracy', trControl=control)
confusionMatrix(new_rf)

# k = 15
control <- trainControl(method='cv', number=15)
new_rf <- train(status ~ ., clean_colon, method='rf', 
                metric='Accuracy', trControl=control)
confusionMatrix(new_rf)

# k = 20
control <- trainControl(method='cv', number=20)
new_rf <- train(status ~ ., clean_colon, method='rf', 
                metric='Accuracy', trControl=control)
confusionMatrix(new_rf)







ucla <- read.csv('https://stats.idre.ucla.edu/stat/data/binary.csv')
ucla$admit <- factor(ucla$admit)

control <- trainControl(method='cv', number=10)
formular <- admit ~ gre+gpa+rank
L <- train(formular, ucla, method='svmLinear', metric ='Accuracy',
           trControl=control)
LW <-  train(formular, ucla, method='svmLinearWeights', metric ='Accuracy',
             trControl=control)
P <-  train(formular, ucla, method='svmPoly', metric ='Accuracy',
            trControl=control)
R <-  train(formular, ucla, method='svmRadial', metric ='Accuracy',
            trControl=control)
RW <-  train(formular, ucla, method='svmRadialWeights', metric ='Accuracy',
             trControl=control)
f100 <-  train(formular, ucla, method='rf', ntree=100, metric ='Accuracy',
               trControl=control)
f300 <-  train(formular, ucla, method='rf', ntree=300, metric ='Accuracy',
               trControl=control)
f500 <-  train(formular, ucla, method='rf', ntree=500, metric ='Accuracy',
               trControl=control)
r <-  train(formular, ucla, method='rpart', metric ='Accuracy',
            trControl=control)
k <-  train(formular, ucla, method='knn', metric ='Accuracy',
            trControl=control)
g <-  train(formular, ucla, method='glm', metric ='Accuracy',
            trControl=control)

resamp <- resamples(list(선형=L, 선형가중치=LW, 다항식=P, RBF=R, 가중치=RW,
                           rf100=f100, rf300=f300, rf500=f500, tree=r, knn=k, glm=g))
summary(resamp)

sort(resamp, decreasing=T)
dotplot(resamp)






# 3.

voice <- read.csv('C:/workspace/R/data/voice.csv')
voice$label <- factor(voice$label)
control <- trainControl(method = 'cv', number=10)
formular <- label ~ IQR+meanfun

L <- train(formular, voice, method='svmLinear', metric ='Accuracy',
           trControl=control)
LW <-  train(formular, voice, method='svmLinearWeights', metric ='Accuracy', trControl=control)
P <-  train(formular, voice, method='svmPoly', metric ='Accuracy', trControl=control)
R <-  train(formular, voice, method='svmRadial', metric ='Accuracy', trControl=control)
RW <-  train(formular, voice, method='svmRadialWeights', metric ='Accuracy', trControl=control)
f100 <-  train(formular, voice, method='rf', ntree=100, metric ='Accuracy', trControl=control)
f300 <-  train(formular, voice, method='rf', ntree=300, metric ='Accuracy', trControl=control)
f500 <-  train(formular, voice, method='rf', ntree=500, metric ='Accuracy', trControl=control)
r <-  train(formular, voice, method='rpart', metric ='Accuracy', trControl=control)
k <-  train(formular, voice, method='knn', metric ='Accuracy', trControl=control)
g <-  train(formular, voice, method='glm', metric ='Accuracy', trControl=control)

resamp <- resamples(list(선형=L, 선형가중치=LW, 다항식=P, RBF=R, 가중치=RW,
                           rf100=f100, rf300=f300, rf500=f500, tree=r, knn=k, glm=g))
summary(resamp)

sort(resamp, decreasing=T)
dotplot(resamp)


# 4.
str(kyphosis)

set.seed(2021)
train_index <- createDataPartition(kyphosis$Kyphosis, p=0.6, list=F)
ky_train <- kyphosis[train_index, ]
ky_test <- kyphosis[-train_index, ]
table(ky_train$Kyphosis)
table(ky_test$Kyphosis)

# 디시젼 트리
dt <- rpart(Kyphosis ~ ., ky_train)
dt_pred <- predict(dt, ky_test, type='class')