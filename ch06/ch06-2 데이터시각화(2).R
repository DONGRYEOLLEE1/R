# 데이터 시각화(2)
library(gapminder)
library(dplyr)

# 연도별, 대륙별 총 인구수
y <- gapminder %>% 
    group_by(year, continent) %>% 
    summarize(c_pop=sum(pop))
head(y,10)

# 1단계 - 막 그래프
plot(y$year, y$c_pop)

# 2단계 - 마커의 색상을 대륙별로 다르게 지정
plot(y$year, y$c_pop, col=y$continent)

# 3단계 - 마커의 모양을 대륙별로 다르게 지정
plot(y$year, y$c_pop, col=y$continent, pch=c(1:5))
plot(y$year, y$c_pop, col=y$continent, pch=c(1:length(levels(y$continent))))

# 4단계 - 범례 표시
legend('topleft', legend=levels(y$continent), 
       pch=c(1:length(levels(y$continent))), 
             col=c(1:length(levels(y$continent))))



# 대륙별 인당 GDP, 기대수명
plot(gapminder$gdpPercap, gapminder$lifeExp, 
     pch=c(1:length(levels(gapminder$continent))), 
     col=gapminder$continent,)
legend('bottomright', legend=levels(gapminder$continent), 
       pch=c(1:length(levels(gapminder$continent))), 
       col=c(1:length(levels(gapminder$continent))))


# 로그 스케일 적용
plot(log10(gapminder$gdpPercap), gapminder$lifeExp, 
     pch=c(1:length(levels(gapminder$continent))), 
     col=gapminder$continent,)

# ggplot을 이용해서 그려보기 (간편, 정갈)
library("ggplot2")
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, col=continent)) + 
    geom_point() + 
    scale_x_log10()
ggplot(gapminder, aes(gdpPercap, lifeExp, col=continent)) + 

# 인구수에 따라 포인트 코기 조절
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, 
                      col=continent, size=pop)) + 
    geom_point() + 
    scale_x_log10()
ggplot(iris, aes(x=mean(setosa_sep$set_sep), y=Species, col=Species)) + 
    geom_bar(stat='identity')
mean
# 포인트의 투명도 조절
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, 
                      col=continent, size=pop)) + 
    geom_point(alpha=0.5) + 
    scale_x_log10()


# 2007년도 자료만 보기 - dplyr과 ggplot 연동
gapminder %>% 
    filter(year==2007) %>% 
    ggplot(aes(x=gdpPercap, y=lifeExp, col=continent, size=pop)) + 
    geom_point(alpha=0.5) + 
    scale_x_log10()



ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, 
                      col=continent, size=pop)) + 
    geom_point(alpha=0.5) + 
    scale_x_log10() + 
    facet_wrap(~year)

# 시각화 기본기능
# 1. 비교/순위
iris %>% 
    filter(Species=="setosa") %>% 
    ggplot(aes(Sepal.Length, Sepal.Width)) + 
    geom_bar(stat='identity') + 
    coord_flip()
gapminder %>% 
    filter(continent=="Asia" & year==1952) %>% 
    ggplot(aes(reorder(country, pop), pop)) + 
    geom_bar(stat='identity') + 
    coord_flip()

# 2. 비교/순위 - 로그 스케일
gapmidner %>% 
    filter(continent=="Asia" & year==1952) %>% 
    ggplot(aes(reorder(country, pop), pop)) + 
    geom_bar(stat='identity') + 
    coord_flip() +
    scale_y_log10()

# 3. 변화 추세
# 대한민국의 기대수명을 연도별로 표기
gapminder %>% 
    filter(country=="Korea, Rep.") %>% 
    ggplot(aes(year, lifeExp, col=country)) +
    geom_point() + 
    geom_line(col='blue')


# 4. 여러 데이터의 변화 추세
# 기대수명을 대륙별로 표기
ggplot(gapminder, aes(year, lifeExp, col=continent)) + 
    geom_point(alpha=0.2) + 
    geom_smooth()

# 5. 분포
x <- filter(gapminder, year==1952)
hist(x$lifeExp, main='Histogram of lifeExp in 1952')   # y축은 값 설정 줄 필요없음

x %>% 
    ggplot(aes(lifeExp)) + 
    geom_histogram()                     # basic ggplot

# 6. 대륙별 세분화된 분포 특성 - boxplot
x %>% 
    ggplot(aes(continent, lifeExp)) + 
    geom_boxplot()

# 7. 상관 관계 
plot(log10(gapminder$gdpPercap), gapminder$lifeExp)
