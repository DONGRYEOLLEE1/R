# 2. MVP 예측해보기

library(rpart)
library(caret)
library(e1071)
library(randomForest)
library(dplyr)
library(ggplot2)

getwd()
stat <- read.csv('data/Seasons_Stats_NEW1.csv')
mvp <- read.csv('data/MVP.csv')

stat <- stat %>% filter(Year>=2000)
stat1 <- stat %>% select(G, MP, PT, TRB, AST, STL, FG., X3P., FT., MVP)
stat_not_mvp <- stat1 %>% filter(MVP==0)
mvp <- mvp %>% filter(Year>=2000)
mvp1 <- mvp %>% select(G, MP, PT, TRB, AST, STL, FG., X3P., FT., MVP)
mvp2 <- as.data.frame(mvp1)

stat1$MVP <- factor(stat1$MVP)

a <- stat_not_mvp[sample(nrow(stat_not_mvp), 150), ]
b <- mvp2[sample(nrow(mvp2), 15), ]
c <- stat_not_mvp[sample(nrow(stat_not_mvp), 50), ]
d <- mvp2[sample(nrow(mvp2), 5), ]

train_1 <- rbind(a, b)
test_1 <- rbind(c, d)


set.seed(30000)
train_index <- createDataPartition(stat_not_mvp$MVP, p=0.8, list=F)
stat1_train <- stat1[train_index, ]
stat1_test <- stat1[-train_index, ]

dtc <- rpart(MVP ~ ., train_1)
summary(dtc)
pred <- predict(dtc, test_1, type='class')
confusionMatrix(pred, test_1$MVP)


# stat1
pred <- predict(dtc, stat1, type='class')
confusionMatrix(pred, stat1$MVP)
