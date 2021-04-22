# 배열(Array)
x <- array(1:8, c(2,4))            # (2,4)차원의 배열 생성
x
x <- array(1:15, c(3,5))
x
y <- array(1:5, c(2,4))
y
z <- array(1:24, c(4,3,2))
z
z[3,2,2]    # 19
z[4,3,1]    # 12
x[1, ]

# Matrix(2차원 배열)
matrix(1:12, nrow = 3)     # array(1:12, c(3,4))와 동일
matrix(1:100, nrow = 10)
matrix(1:12, nrow = 3, byrow = T)
matrix(1:121, nrow = 11, byrow = T)

# vector를 묶어 Array 생성
v1 = 1:4
v2 = 5:8
v3 = 9:12
cbind(v1,v2,v3)     # 열 단위로 묶어 배열 생성
rbind(v1,v2,v3)     # 행 단위로 묶어 배열 생성

cbind(x,y)          # 2차원 배열을 묶어도 2차원 배열 생성
rbind(x,y)


# 행렬 연산
x <- matrix(1:4, nrow=2)
y <- matrix(5:8, ncol=2)
y
x

# element-wise +,-,*
x + y
x*y
x-y
-x-y

# 수학적인 행렬 곱(dot product)
x%*%y

# 전치 행렬(transpose)
t(x)
x

# 역행렬(inverse matrix), 곱하면 단위행렬이 나오는 행렬 (I, Identity)
solve(x)
x%*%solve(x)

# 행렬식(determinant)
det(x)

# 배열 연산에 사용되는 함수 
apply(x, 1, mean)            # 1:  행별로 적용
apply(x, 2, mean)            # 2 : 열로 적용
x
apply(x, 1, sum)
sum(x)
apply(x, 2, sum)
dim(x)                      # 차원을 알려주는 함수 (차원의 수)


# 샘플링
a <- array(1:12, c(3,4))
a
sample(x)
sample(a)
sample(a, 3)
a <-array(1:45, c(5,9))
a
sample(a)
sample(a, 4)
sample(a, 4, prob = c(1:12))

# 데이터 프레임
name = c('철수', '춘향', '길동')
age = c(22, 20, 25)
gender = factor(c('M', 'F', 'M'))
blood_type = factor(c('A', 'O', 'B'))           

patients <- data.frame(name, age, gender, blood_type)
patients

patients$name
patinets$blood_type
patients$blood_type
typeof(patients$name)
patients[1,]                     # 첫 번째 행 모두
patients[,1]                     # 첫 번째 열 모두
patients[1,2]
patients[3,4]
patients[,2]                     # patients$age 와 동일
patients[2,3]
patients$gender
patients[1,]
patients[patients$name=='철수',]   # patients[1,], filtering
patients[patients$name=='철수',c('age','gender')]   # selection

# 데이터프레임의 속성명을 변수명으로 사용(attach ~ detach)
attach(patients)
name
blood_type
[[patients$name]]
[2,3]
detach(patients)

head(cars)
attach(cars)
speed
dist
detach(cars)
speed

mean(cars$speed)
max(cars$dist)
max(cars$speed)
with(cars,mean(speed))      # mean(cars$speed)와 같음

# subset   (일부 데이터만 추출)
subset(cars, speed>20)
speed
cars
cars[cars$speed>20,]
subset(cars, speed>20, select=c(dist))

# 결측값(NA) 처리
head(airquality)
plot(airquality)
str(airmiles)
str(airq)
str(airquality)
sum(airquality$Ozone)
sum(airquality$Solar.R)
head(airquality)
head(airquality, 10)
head(na.omit(airquality))             # 결측값이 포함된 행 제거
airquality[is.na(airquality)] <- 0
airquality

# 병합(merge)
patients
patients1 <- data.frame(name,age,gender)
patients2 <- data.frame(name,blood_type)
merge(patients1, patients2, by='name')

mean(airquality$Ozone)


# 데이터프레임에 행 추가
length(patients1$name)
patients1[length(patients1$name)+1,] <- c('몽룡', 19, 'M')
patients1

patients2[length(patients2$name)+1,] <- c('영희', 'A')
patients2

# 데이터프레임에 열 추가
patients1['birth_year'] <- c(1500,1550,1600,1800)
patients1


#merge
# Inner join
merge(patients1, patients2)                 # x, y
# Left outer join
merge(patients1, patients2, all,x=T)
# Right outer join
merge(patients1, patients2, all,y=T)
# (Full) outer join
merge(patients1, patients2, all,x=T, all.y=T)