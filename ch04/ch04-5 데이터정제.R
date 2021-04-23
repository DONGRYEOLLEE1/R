# 데이터 정제
getwd()
setwd('c:/workspace/r')
score <- read.csv('data/students2.csv')
score

for (i in 2:4) {
    score[,i] <- ifelse(score[,i]>100 | score[,i]<0, NA, score[,i])
}
score


# 결측값 처리
head(airquality)
sum(is.na(airquality))    # 44개
table(is.na(airquality))  # T=결측치

sum(is.na(airquality$Temp))        # 결측치 0
mean(airquality$Temp)              # 결측치가 없기 떄문에 평균값 바로 구하기 가능

sum(is.na(airquality$Ozone))       # 결측치 37개
mean(airquality$Ozone)             # 에러(NA) 결측치가 있기 때문에
mean(airquality$Ozone, na.rm = T)  # na.rm = T   NA 배제하고 계산(평균)해주는 함수


# 결측값 제거
air_narm <- na.omit(airquality)    # 결측값 제거해주는 함수 na.omit
sum(is.na(air_narm))               # 결측값 제거 후, 결측치 0

# 결측값 대체
options(digits=4)
airquality$Ozone <- replace(airquality$Ozone, is.na(airquality$Ozone), mean(airquality$Ozone, na.rm = T))
head(airquality)
airquality$Solar.R <- replace(airquality$Solar.R, is.na(airquality$Solar.R), median(airquality$Solar.R, na.rm = T))
head(airquality)

# 이상값(Outlier) 처리
patients2 <- data.frame(name=c('환자1', '환자2', '환자3', '환자4', '환자5'), 
                        age= c(22, 20, 25, 30, 27), 
                        gender=(c("M", "F", "M", "K", "F"), 
                                blood_type=c("A", "O", "B", "AB", "C")))
patients

#성별 이상치 제거
patients_outrm <- patients[patients$gender=="M"|patients$gender=="F",]
patients_outrm

# 성별과 혈액행의 이상치 제거
# case 1
patients_outrm1 <- patients[(patients$blood_type=="A" | patients$blood_type=="B" | patients$blood_type=="AB" | patients$blood_type=="O") & (patients$gender=="M" | patients$gender=="F"), ]
patients_outrm1

# case 2
patients_outrm <- patients[patients$gender %in% c('M', 'F') & patients$blood_type %in% c('A', 'B', 'AB', 'O'),]
patients_outrm

# 이상치를 NA로 대체
patients$gender <- ifelse(patients$gender=="M" | patients$gender=="F", NA, patients$gender)
patients

patients2 <- data.frame(name=c('환자1', '환자2', '환자3', '환자4', '환자5'), 
                        age=c(22, 20, 25, 30, 27),
                        gender=c("M", "F", "M", "K", "F"), blood_type=c("A", "O", "B", "AB", "C"))
patients2                        


patients2$gender <- ifelse(patients2$gender %in% c('M', 'F'), patients2$gender, NA)
patients2$blood_type <- ifelse(patients2$blood_type %in% c('A', 'B', 'O', 'AB'), patients2$blood_type, NA)
patients2
sum(is.na(patients2))


# 숫자의 이상치
boxplot(airquality[, c(1:4)])
boxplot(airquality[,1])$stats
boxplot(airquality$Ozone)$stats

air <- airquality
air$Ozone <- ifelse(air$Ozone<boxplot(airquality$Ozone)$stats[1] | 
                        air$Ozone>boxplot(airquality$Ozone)$stats[5], 
                    NA, air$Ozone)
sum(is.na(air$Ozone))
sum(is.na(airquality$Ozone))              # 즉, airquality$ozone 엔 2개의 이상치가 있었다.
mean(air$Ozone, na.rm = T)
mean(airquality$Ozone, na.rm = T)         # 평균값 차이가 약 2pt

