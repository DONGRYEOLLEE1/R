library(dplyr)
library(ggplot2)


getwd()
stat <- read.csv('data/Seasons_Stats_NEW.csv')

# 결측치 제거
non_omit_stat <- na.omit(stat)
non_omit_stat

# 각 나이대별 스탯 평균
non_omit <- non_omit_stat %>% 
    filter(Year>=2000 & Pos == 'SG' & MP>=median(MP)) %>% 
    group_by(Age) %>% 
    select(X3P., X2P., FT., PT, MP) %>% 
    arrange(desc(Age)) %>% 
    summarize('3P%'=mean(X3P.), '2P%'=mean(X2P.), 
              'FT%'=mean(FT.), 'PT'=mean(PT), 'MP'=mean(MP))


options(digits=2)
View(non_omit)


Age_stat <- non_omit_stat %>% 
    filter(Year>=2000 & MP>=median(MP)) %>% 
    group_by(Age) %>% 
    select(Pos, PT) %>% 
    arrange(desc(Age))


ggplot(Age_stat, aes(Age, PT, col=Pos)) + 
    geom_point(position='jitter')
