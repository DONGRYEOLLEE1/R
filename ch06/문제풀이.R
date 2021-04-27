# 1. gapminder 데이터에 기록된 전 세계 인구의 구성 비율은 어떻게 변화하고 있을까?
# (1) 전체 관측 기간(1952년~2007년) 중 1952년도의 인구 구성을 추출한 후 [그림6-25]와 같이 시각화하라.
data(gapminder)
x <-  gapminder %>% 
    filter(year==1952) %>% 
    select(continent, pop) %>% 
    arrange(desc(pop)) %>% 
    head()
pie(x$pop, x$continent)
barplot(x$pop, names.arg = x$continent)

# (2) 1952년~2007년의 인구 구성을 for 문을 이용해 반복적으로 시각화하라.
y <- gapminder %>% 
    select(continent, pop) %>% 
    arrange(desc(pop))

for (i in c(1952:2007)) {
    y_cor <- cor(y[,i], cor[,i])
    print(y_cor)
}
# (3) 시각화 그래프를 통해 알게 된 사실을 몇 가지로 요약하라.


# 3. ggplot2를 이용하여 Iris 데이터 셋에 대해서 다음 문제를 푸세요.
# (1) 품종별로 Sepal/Petal의 Length, Width 산점도 그리기. (총 6개)
data(iris)
iris %>% 
    filter(Species=="setosa") %>% 
    ggplot(aes(Sepal.Length, Sepal.Width, col="setosa")) + 
    geom_point(alpha=0.5)

iris %>% 
    filter(Species=="setosa") %>% 
    ggplot(aes(Petal.Length, Petal.Width, col="setosa")) + 
    geom_point(alpha=0.5)

iris %>% 
    filter(Species=="versicolor") %>% 
    ggplot(aes(Sepal.Length, Sepal.Width, col="versicolor")) + 
    geom_point(alpha=0.5)

iris %>% 
    filter(Species=="versicolor") %>% 
    ggplot(aes(Petal.Length, Petal.Width, col="versicolor")) + 
    geom_point(alpha=0.5)

iris %>% 
    filter(Species=="virginica") %>% 
    ggplot(aes(Sepal.Length, Sepal.Width, col="virginica")) + 
    geom_point(alpha=0.5)

iris %>% 
    filter(Species=="virginica") %>% 
    ggplot(aes(Petal.Length, Petal.Width, col="virginica")) + 
    geom_point(alpha=0.5)



# (2) 품종별 Sepal/Petal의 Length/Width 평균을 비교하되 항목을 옆으로 늘어놓은 것(beside=T)과 위로 쌓아올린 것 2개를 그리시오. 
      # (총 12개 항목의 데이터를 2개의 그래프에)


data(iris)
setosa_sep <- iris %>%  
    filter(Species=="setosa") %>% 
    mutate(set_sep=(Sepal.Length+Sepal.Width)*0.5) %>% 
    select(Species, set_sep)

iris %>% 
    filter(Species=="setosa" | Species=="versicolor" | Species=="virginica") %>% 
    ggplot(setosa_sep$set_sep, Species, col=Species)
ggplot( col=Species)

setosa_sep %>% 
    ggplot()
# (3) 박스 플롯 그리기


