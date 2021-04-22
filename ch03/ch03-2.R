# 벡터(Vector, 1차원 데이터)
s <- c(1,2,3,4,5,6)
s2 <- c(1:6)      # ':' ->> 시작:끝
s3 <- c(6:1)
s4 <- 1:5
c(1:3, c(4:6))
c(2:3, c(3,6))
c(1:30)
c(1:30)
c(1, 100, by=2)
seq(1, 100, by=2)   # 1에서 100까지 2씩 증가하는 수열 , from, to, increment
seq(from=100, to=1, by=-3)   # from, to 는 생략 가능 단, by는 반드시 작성
seq(0, 1, by=0.1)
seq(0, 1, by=0.01)
seq(0, 1, length.out=11)     # from, to 숫자는 fix


rep(c(1:3), times=2))
rep(c(1:3), times=2)     # 1~3을 두번(times)반복          1 2 3 1 2 3
rep(c(1:3), each=2)      # 1~3을 각각(each) 두번씩 반복   1 1 2 2 3 3

# 인덱싱
x <- seq(2,10,by=2)
x[1]      # x에서 첫번째 값은 무엇인가   * [] : R만 1로 시작 가능
x[-1]     # x에서 첫번째를 제외한 나머지 값은 무엇인가
x[3]
x[-3]
x[-2]

# slicing
x[1:3]
x[c(1,3,5)]     # 조건부
x[-c(2,4)]      # - : 배제 , 두번째, 네번째 수를 배제 후 값 출력

# 연산
x <- c(1:4)
y <- c(5:8)
z <- c(3,4)
w <- c(5:7)
x+2   # 1+2 2+2 3+2 4+2
x+y   # 1+5 2+6 3+7 4+8
x+z
x+w

length(w)
length(x+y)
length(s2)

x>2
x>=2
all(x>2)   # 전부다 x가 2보다 큰가? ...... F
any(x>2)   # 단 한개라도 x가 2보다 큰것이 있는가? ....... T

# fancy indexing
y[x>2]

x<-1:10
head(x)       # head의 default 값은 6
head(x, 3)
tail(x)
tail(x, 3)

# 집합 연산
x <-1:3
y <-3:5
z <-c(3,1,2)

union(x, y)        # 합집합
intersect(x, y)    # 교집합
setdiff(x,y)       # 차집합 (x-y)
setequal(x,y)      # x와 y가 같은가? .... F
setequal(x,z)      # .................... T

x <- c(1:5)
x <- c(1:10)
x <- c(1:10)
x
seq(head(x,2), tail(x,1), by=2)
head(x,1)
tail(x,1)
seq(from = 2, to = 10, by = 2)
x[x%%2==0]
seq(from = x[2], to = tail(x,1), by=2)
seq(x[2], tail(x,1), by=2)
head(x,2)
head(x,-2)
head(x,-1)
head(x,3
head(x,3)     
head(x)
head(x,1)
head(x,2)
seq(x[2], tail(x,1), by=2)



x <- c(1:5)
x <- c(1:5, 6:10)
x


x <- c(1:10)
seq(x[2], tail(x,1), by=2)
x <- c(seq(x[2], tail(x,1), by=2))
