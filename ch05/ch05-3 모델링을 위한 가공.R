# 모델링을 위한 가공
library(dplyr)

# Wine 데이터
wine <- read.table('data/wine.data.txt', sep =',')
head(wine)

columns <- readLines('data/wine.name.txt')
columns

# wine data의 column명
names(wine)
names(wine)[2:14] <- columns
names(wine)

# substr 함수
a <- 'A quick brown fox jumps over the lazy dog.'
nchar(a)
c <- "하헤히호후"
nchar(c)
substr(a, 3, 7)
substr(a, nchar(a)-3, nchar(a)-1)

names(wine)[2:14] <- substr(columns, nchar(columns, 4, nchar(columns))
names(wine)[1] <- "Y"
names(wine)

# 데이터셋 분할하기
train_set = sample_frac(wine, 0.75)
str(train_set)
table(wine$V1)
table(train_set$V1)

test_set = setdiff(wine, train_set)
table(test_set$V1)
