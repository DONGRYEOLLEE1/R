getwd()

# 변수(Variable)
x <- 1
y <- 2
z <- x+y
z

# Swapping (변수 바꾸는 방법)
temp <- x
x <- y
y <- temp

typeof(x)
a <- 'string'
typeof(a)
b <-'double quote'
typeof(b)
c <- '한글'
typeof(c)

# 실수(Numeric)
x <- 5
y <- 2
x/y

# 복소수(Complex)
xi <- 1+2i
yi <- 1-2i
xi+yi
xi-yi
xi*yi

# 범주형(Category)
blood_type = factor(c('A', 'B', 'O', 'AB'))
blood_type


# 논리형(Boolean)
TRUE
FALSE
# python에선 맨앞글자만 대문자로 표기

T
F

xinf = Inf
yinf = -Inf
xinf/yinf
# NaN -> 연산 불가능한 값 표시

# 데이터형 확인 함수
class(x)   # R 객체지향 관점
typeof(x)  # R 언어 자체관점
typeof(yi)
is.integer(x)
is.numeric(x)
is.complex(xi)
is.complex(x)
is.numeric(a)
is.character(blood_type)
is.character(x)
is.character(a)
is.na(x)
is.na(xinf/yinf)


# 데이터형 변환 함수  (as.~~~())
is.integer(as.integer(x))
is.integer(as.integer(x))
is.factor((c))

# 산술 연산자(+,-,*,/,^,%%,%/%,**)(Operator)
5^2
4^(1/2)
4%%2
4%/%2  # 몫
x<y
x%%y   # 나머지 (Modulo)
y%%x

# 비교 연산자(<, <=, >, >=, ==, !=)
x < y
x <= y
y <= x
'***'
x >=y
x == x
x = x
x == y
x != y
x != x

# 논리 연산자(!, |, &)
!T
!F
x |y       # OR
x||y     
x&y        # AND
isTRUE(x)
x||y
a <- c(F, F, T, T)
b <- c(F, T, F, T)
a | b    # element-wise OR
a ||b    
a&&b
2^(-3) - 5**(1/2) > 2     # 2^-3-5**1/2>2 띄어쓰기 및 괄호
