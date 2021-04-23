# 함수
# 팩토리얼 함수
fact <- function(x) {
    prod <- 1
    for (i in 1:x) {
        prod <- prod * i
    }
    return(prod)
}
fact(5)
fact(10)
fact(20)

# 정수 a ~ b 의 합을 구하는 함수(range_sum)
range_sum <- function(a, b) {
    sum <- 0
    for (i in a:b) {
        sum <- sum + i
    }
    return(sum)
}
range_sum(1,10)

# 재귀함수
facto <- function(n) {
    if (n == 0) {
        return(1)
    }
    return(n * facto(n-1))
}
facto(10)

# 피보나치 수열
fibo <- function(m) {
    if (m==1 | m==0) {
        return(1)
    }
    return(fibo(m-1) + fibo(m-2))
}

for (i in 0:10) {
    print(paste(i, fibo(i)))
}

# Peak-to-Peak 함수
peak2peak <- function(x) {
    return(max(x) - min(x))
}
mat <- matrix(1:12, nrow = 3)
apply(mat, 1, mean)                 # 이 식에서 함수 = mean
mat
apply(mat, 1, peak2peak)            # 사용자 정의 함수인 peak2peak
apply(mat, 2, peak2peak)
