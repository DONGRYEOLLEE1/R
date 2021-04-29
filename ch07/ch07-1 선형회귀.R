# 현실 세계의 모델링
X = c(3, 6, 9, 12.)
Y = c(3, 4, 5.5, 6.5)
plot(X, Y)

# model 1: y=0.5x1.0
Y1 = 0.5*X + 1.0
Y1

# 평균 제곱 오차 : Mean Squared Error
(Y - Y1)**2
sum((Y - Y1)**2)
mse <- sum((Y - Y1)**2)/ length(Y)
mse

# model 2 : y=5/12+ 7/4
Y2 = 5/12*X + 7/4
Y2

mse2 <- sum((Y- Y2)**2) / length(Y)
mse2

# R의 단순 선형회귀 모델 lm
model <- lm(Y ~ X)
model

plot(X, Y)
abline(model, col='red')
fitted(model)
mse_model <- sum((Y - fitted(model))**2) / length(Y)
mse_model

# 잔차 - Residuals 
residuals(model)

# 잔차 제곱합 == sum((Y - fitted(model))**2) = 0.05
deviance(model)

# 평균 제곱오차(MSE)
deviance(model) / length(Y)

summary(model)  

# 예측
newX <- data.frame(x=c(1.2, 2.0, 20.65))
newX
newY <- predict(model, newdata=newX)
newY

# 연습문제 1
X <- c(10.0, 12.0, 9.5, 22.2, 8.0)
Y <- c(360.2, 420.0, 359.5, 679.0, 315.3)
model_1 <- lm(Y ~ X)
model_1

Y = 25.59*X + 110.97
plot(X, Y)
abline(model_1, col='red')
residuals(model_1)
deviance(model_1) / length(X)

new_sample <- data.frame(X=c(10.5, 25.0, 15.0))
new_sample
new_pre <- predict(model_1, newdata=new_sample)
new_pre

plot(new_sample$X, new_pre)
abline(model_1, col='red')
