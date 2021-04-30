airquality
non_airquality <- airquality[,1:4]
non_airquality <- na.omit(non_airquality)

tm_ozn <- lm(Temp ~ Ozone, data=non_airquality)
coef(tm_ozn)
summary(tm_ozn)
tm <- lm(Temp ~ ., data=non_airquality)
tm
summary(tm)

predict(tm)
residuals(tm)
predict(tm, newdata = data.frame(Ozone=c(10,20,30), 
                                 Solar.R=c(10,20,30), 
                                 Wind=c(10,20,30)))

predict(tm, newdata = data.frame(Ozone=c(10,20,30), 
                                 Solar.R=c(10,20,30), 
                                 Wind=c(10,20,30)), se.fit = TRUE)


t.test(airquality$Temp, airquality$Ozone, paired=T, alternative="less")

t.test(non_airquality$Ozone)
par(mfrow=c(1,1))
plot(tm)
cor.test(non_airquality$Ozone, non_airquality$Temp)



fit1 <- lm(Temp ~ ., data=non_airquality)
fit2 <- lm(Temp ~ Ozone, data=non_airquality)

AIC(fit1, fit2)  # 값이 적을수록 좋음

t.test(non_airquality$Ozone, non_airquality$Temp)
t.test(non_airquality$Temp, non_airquality$Ozone)
t.test(non_airquality$Ozone)

coef(tm_ozn)
summary(tm_ozn)

# 계수의 신뢰구간
confint(tm_ozn)
confint(tm)

# step 함수를 통해 유의미하지않은 변수를 제거
step(tm_ozn, direction='backward')

# anova 함수를 통해 두 회귀모델을 평가해보자.
anova(tm, tm_ozn)  
# p-value 값이 0.05보다 크므로 
# 앞에 제거된 두 변수는 회귀모형에 대한 기여도가 적었음을 알 수 있다.
