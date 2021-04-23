# 반복문
# 1. Repeat 

i <- 1
sum <- 0

repeat {
    if (i > 10) {
        break                         # break = i가 10 이상이 되는 순간 반복 stop
    }
    sum <- sum + i
    i <- i+1
}
print(sum)


# 2. While

i <- 1
sum <- 0
while (i <=10) {
    sum <- sum + i
    i <- i+1
}
print(sum)

# 3. for

sum <- 0
for (i in 1:10) {
    sum <- sum + i
}
print(sum)


# 연습문제 (10!을 구하시오)
mul <- 1
for (i in 10:1) {
    mul <- mul*i
}
print(mul)


# 2^1 ~ 2^10 합
sum <- 0
for (i in 1:10) {
    sum <- sum + 2^i
}
print(sum)


# 연습문제 (1:100 홀수만 더해라)

sum <- 0
for (i in 1:100) {
    if (i%%2==1) {
        sum <- sum + i
    }
}
print(sum)


# 1 ~ 100 사이의 홀수의 합
# case 1
odd_sum <- 0
for (i in 1:100) {
    if (i%%2==1) {
        odd_sum <- odd_sum + i
    }
}
print(odd_sum)

# case 2
odd_sum <- 0
for (i in seq(1,100,by=2)) {
    odd_sum <- odd_sum + i
}
print(odd_sum)

# 구구단 만들기
for (k in 1:9) {
    print(paste('2', 'x', k, '=', 2*k))
}

for (i in 2:9) {
    print(paste0(i, ' 단 ========================='))
    for (k in 1:9) {
        print(paste(i, 'x', k, '=', 1*k))
    }
}

# Matrix 문제 풀기
# 1. 각 숫자의 합
x <- c(1:12)
matrix(x, nrow = 3)
sum(matrix(x))
# 2. 각 숫자 제곱의 합
x = array(1:12, dim=c(3,4))
x
x^2
sum(x^2)
# 3. 첫 행의 합, 두번째 행 제곱의 합, 세번째 행 세제곱의 합
sum(x[1,])

# 풀이
mat <- matrix(1:12, nrow=3)
nrow <- 3
ncol <- 4
mat
sum1 <- 0
sum2 <- 0
sum3 <- 0
for (i in 1:nrow) {
    for (k in 1:ncol) {
        sum1 <- sum1 + mat[i,k]
        sum2 <- sum2 + mat[i,k]^2
        sum3 <- sum3 + mat[i,k]^i
    }
}
print(paste(sum1, sum2, sum3))


# 별그리기
for (i in 1:5) {
    star <- ''
    for (k in 1:i) {
        star <- paste0(star, '+')
    }
    print(star)
}

# list 만들기
lst = list()
lst <- append(lst, 3)
lst <- append(lst,5)
lst <- append(lst, 7)
length(lst)
lst[2]
lst[3]

lst = list()
for (i in 1:5) {
    lst <- append(lst, i)
}
lst

for (element in lst) {
    print(element)
}

vec <- c(1,7,8)
for (element in vec) {
    print(element)
}

for (element in mat) {
    print(element)
}

# 약수
N <- 6
for (num in 1:N) {
    if (N%%num==0) {
        print(num)
    }
}

# 약수의 합
sum <- 0
for (num in 1:N) {
    if (N%%num==0) {
        sum <- sum + num
    }
}
print(sum)

# Perfect Number
# 2 에서 10000사이의 완전수를 찾으시오.

for (N in 2:10000) {
    sum <- 0
    for (num in 1:(N-1)) {
        if (N%%num==0) {
            sum <- sum + num
        }
    }
    if (sum==N) {
        print(N)
    }
}