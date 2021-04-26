# Avocado 사례
library(dplyr)

setwd('C:/workspace/R')
avocado <- read.csv('data/avocado.csv')
glimpse(avocado)
summary(avocado)
head(avocado)

# 지역별 평균 판매량과 가격
avocado %>% 
    group_by(region) %>%
    summarize(P_avg=mean(AveragePrice), V_avg=mean(Total.Volume))

# 지역별, 연도별 평균 판매량과 가격
avocado %>% 
    group_by(region, year) %>%
    summarize(P_avg=mean(AveragePrice), V_avg=mean(Total.Volume))

# 지역별, 연도별, 유기농여부 평균 판매량과 가격
avocado %>%
    group_by(region, year, type) %>%
    summarize(P_avg=mean(AveragePrice), V_avg=mean(Total.Volume))


x_avg=avocado %>% 
    group_by(region, year, type) %>% 
    summarize(V_avg=mean(Total.Volume), P_avg=mean(AveragePrice))

library(ggplot2)
x_avg %>% 
    filter(region!="TotalUS") %>% 
    ggplot(aes(year, V_avg, col=type)) + 
    geom_line() + 
    facet_wrap(~region)

arrange(x_avg, desc(V_avg)) %>% head(10)
x_avg <- x_avg %>% 
    filter(region!="TotalUS")
arrange(x_avg, desc(V_avg)) %>% head(10)

# California , 2018년
avocado %>% filter(region=="California" & year==2018) %>% 
    select(region, Date, AveragePrice, Total.Volume, type)

# California, 2018, 연도별이 아닌 월별 집계
library(lubridate)
year('2021-04-26')
month('2021-04-26')
day(as.Date('2021-04-26'))                # 문자열이나, 숫자나 결과는 똑같음
wday('2021-04-26')

m_avg <- avocado %>% 
    group_by(region, year, month(Date), type) %>% summarize(V_avg=mean(Total.Volume), P_avg=mean(AveragePrice))
head(m_avg)

