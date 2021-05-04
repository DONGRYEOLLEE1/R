1. ucla 데이터  4가지 모델(dt, rf, svm, knn) 에 대해 모델링, 예측, 평가
2. wine 데이터   


1.
library(rpart)
library(caret)
library(e1071)
library(randomForest)

# dt
ucla <- read.csv('https://stats.idre.ucla.edu/stat/data/binary.csv')
ucla$admit <- factor(ucla$admit)    # 범주형

# 훈련/테스트 셋
set.seed(2021)
train_index <- createDataPartition(ucla$admit, p=0.8, list=F)
ucla_train <- ucla[train_index, ]
ucla_test <- ucla[-train_index, ]

# 결정 트리
dt <- rpart(admit ~ ., ucla_train)
dt_pred <- predict(dt, ucla_test, type='class')
t <- table(dt_pred, ucla_test$admit)
t         # 혼동행렬 (confusionMatrix)
dt_acc <- (t[1,1] + t[2,2]) / nrow(ucla_test)
dt_acc       # 디시젼 트리 정확도 (Accuracy)

# 랜덤 포레스트
rf <- randomForest(admit ~ ., ucla_train)
rf_pred <- predict(rf, ucla_test, type='class')
t <- table(rf_pred, ucla_test$admit)
rf_acc <- (t[1,1] + t[2,2]) / nrow(ucla_test)
rf_acc      # 랜덤 포레스트 정확도


# 서포트 백터 머신
sv <- svm(admit ~., ucla_train)
sv_pred <- predict(sv, ucla_test, type='class')
t <- table(sv_pred, ucla_test$admit)
sv_acc <- (t[1,1] + t[2,2]) / nrow(ucla_test)
sv_acc     # 서포트 백터 머신 정확도


# k-NN
library(class)
kn_pred <- knn(ucla_train[, 2:4], ucla_test[, 2:4], 
               ucla_train$admit, k=5)    # y값이 1열, 독립변수가 [2:4]
t <- table(kn_pred, ucla_test$admit)
kn_acc <-  (t[1,1] + t[2,2]) / nrow(ucla_test)
kn_acc      # k-nn 정확도



# 로지스틱 회귀
lr <- glm(admit ~ ., ucla_train, family='binomial')
lr_pred <- predict(lr, ucla_test, type='response')
lr_pred <- ifelse(lr_pred > 0.5, 1, 0)
t <- table(lr_pred, ucla_test$admit)
lr_acc <- (t[1,1] + t[2,2]) / nrow(ucla_test)
lr_acc

print(paste(dt_acc, rf_acc, sv_acc, kn_acc, lr_acc))


2. 

setwd('C:/workspace/R/data')
wine <- read.table('wine.data.txt', sep = ",")
head(wine)
columns <- readLines('wine.name2.txt')   # /, 공백 읽지 못함
columns
names(wine)[2:14] <- substr(columns, 4, nchar(columns))
names(wine)[1] <- 'Y'
head(wine)
str(wine)
wine$Y <- factor(wine$Y)

# 훈련/테스트 셋
set.seed(2021)
train_index <- createDataPartition(wine$Y, p=0.8, list=F)
wine_train <- wine[train_index, ]
wine_test <- wine[-train_index, ]
table(wine$Y)
table(wine_train$Y)     # 80퍼센트 비율
table(wine_test$Y)      # 20퍼센트 비율


# 결정 트리
dt <- rpart(Y ~ ., wine_train)
dt_pred <- predict(dt, wine_test, type='class')
t <- table(dt_pred, wine_test$Y)
t
dt_acc <- (t[1,1] + t[2,2] + t[3,3]) / nrow(wine_test)
dt_acc


# 랜덤 포레스트 
