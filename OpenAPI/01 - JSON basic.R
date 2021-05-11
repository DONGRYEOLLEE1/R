# JSON 기본 (내장 데이터 처리)  'fromJSON', 'toJSON'
library(jsonlite)

pi
json_pi <- toJSON(pi, digits=3)
json_pi             # [3.142]
fromJSON(json_pi)   # 3.142

city <- '대전'
json_city <- toJSON(city)
fromJSON(json_city)

subject <- c('국어', '영어', '수학')
json_subject <- toJSON(subject)
json_subject
fromJSON(json_subject)

# 데이터 프레임
name <- c("Test")
age <- c(25)
sex <- c("F")
address <- c("Seoul")
hobby <- c("Basketball")
person <- data.frame(Name=name, Age=age, Sex=sex, Address=address, Hobby=hobby)
str(person)

json_person <- toJSON(person)
json_person
prettify(json_person)

# 결과값
# [
#  {
#      "Name": "Test",
#      "Age": 25,
#      "Sex": "F",
#      "Address": "Seoul",
#      "Hobby": "Basketball"
#  }
# ]

df_json_person <- fromJSON(json_person)
str(df_json_person)

# 두 데이터프레임의 데이터 값이 같은지 비교
all(person == df_json_person)


# cars 내장 데이터로 테스트
cars
json_cars <- toJSON(cars)
prettify(json_cars)
df_json_cars <- fromJSON(json_cars)
all(cars == df_json_cars)
df_json_cars


# JSON 파일로부터 읽어서 데이텊레임 만들기
library(jsonlite)
setwd('C:/workspace/R')
# person.json 파일
wiki_person <- fromJSON("OpenAPI/person.json")
class(wiki_person)
wiki_person

# sample.json
data <- fromJSON('OpenAPI/sample.json')
str(data)


data <- as.data.frame(data)
names(data) <- c('id', 'like', 'share', 'comment', 'unique', 'msg', 'time')
data$like <- as.numeric(as.character(data$like))
View(data)

# CSV 파일로 저장
write.csv(data, 'OpenAPI/data.csv')

# Data frame을 JSON 파일로 저장
json_data <- toJSON(data)
write(json_data, 'data.json')
prettify(json_data)
