library(dplyr)
library(ggplot2)


getwd()
stat <- read.csv('data/Seasons_Stats_NEW1.csv')
options(digits=2)


# 각 나이대별 스탯 평균
stat_1 <- stat %>% filter(Year>=2000)


SG_stats <- stat_1 %>% 
    filter(Pos == 'SG' & MP>=median(MP)) %>% 
    group_by(Age) %>% 
    select(X3P., X2P., FT., PT, MP) %>% 
    arrange(desc(Age)) %>% 
    summarize('3P%'=mean(X3P., na.rm=T), '2P%'=mean(X2P., na.rm=T), 
              'FT%'=mean(FT., na.rm=T), 'PT'=mean(PT, na.rm=T), 
              'MP'=mean(MP, na.rm=T))

View(SG_stats)

# 각 포지션별로 득점력 시각화 (PT)

pos_pt <- stat_1 %>% filter(MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(PT, Pos) %>%
    arrange(desc(Age)) %>% 
    summarize('PT'=mean(PT, na.rm=T)) %>% 
    ggplot(aes(Age, PT, color=Pos)) + 
    geom_line(size=1)
pos_pt

### SG포지션이 다른 포지션에 비해 득점력이 꺾이는 추세가 낮다


# 각 포지션별로 어시스트수치 시각화 (AST)
pos_ast <- stat_1 %>% filter(MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(AST, Pos) %>% 
    arrange(desc(Age)) %>% 
    summarize('AST'=mean(AST, na.rm=T)) %>% 
    ggplot(aes(Age, AST, color=Pos)) + 
    geom_line(size=1)
pos_ast

# 각 포지션별로 리바운드수치 시각화 (RB)
pos_rb <- stat_1 %>% filter(MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(TRB, Pos) %>% 
    arrange(desc(Age)) %>% 
    summarize('RB'=mean(TRB, na.rm=T)) %>% 
    ggplot(aes(Age, RB, color=Pos)) + 
    geom_line(size=1)
pos_rb

# 각 포지션별로 FG% 수치 시각화 (FG)
pos_fg <- stat_1 %>% filter(MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(FG., Pos) %>% 
    arrange(desc(Age)) %>% 
    summarize('FG'=mean(FG.,na.rm=T)) %>% 
    ggplot(aes(Age, FG, color=Pos)) + 
    geom_line(size=1)
pos_fg

# 각 포지션별로 3P% 수치 시각화
pos_3 <- stat_1 %>% filter(MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(X3P., Pos) %>% 
    arrange(desc(Age)) %>% 
    summarize('X3P'=mean(X3P.,na.rm=T)) %>% 
    ggplot(aes(Age, X3P, color=Pos)) + 
    geom_line(size=1)
pos_3

# 각 포지션별로 2P% 수치 시각화
pos_2 <- stat_1 %>% filter(MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(X2P., Pos) %>% 
    arrange(desc(Age)) %>% 
    summarize('X2P'=mean(X2P.,na.rm=T)) %>% 
    ggplot(aes(Age, X2P, color=Pos)) + 
    geom_line(size=1)

pos_2

# 각 포지션별로 STL 수치 시각화
pos_stl <- stat_1 %>% filter(MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(STL, Pos) %>% 
    arrange(desc(Age)) %>% 
    summarize('STL'=mean(STL, na.rm=T)) %>% 
    ggplot(aes(Age, STL, color=Pos)) + 
    geom_line(size=1)

pos_stl






### 각 포지션별로 리바운드,득점,어시스트 수치 시각화
library(gridExtra)
grid.arrange(pos_pt, pos_ast, pos_rb, pos_fg, pos_3, pos_2, pos_stl,
             ncol=)
ggarrange(pos_pt, pos_ast, pos_rb, pos_fg, pos_3, pos_2, pos_stl,
         ncol=2, legend= 'bottom')





################################################
# SG (PT, 2P, 3P, FT)

sg_pt <- stat_1 %>% filter(Pos == 'SG' & MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(PT, Pos) %>% 
    arrange(desc(Age)) %>% 
    summarize('PT'=mean(PT, na.rm=T)) %>% 
    ggplot(aes(Age, PT)) + 
    geom_line(size=1) + 
    ggtitle("경기당 득점")

sg_ft <- stat_1 %>% filter(Pos == 'SG' & MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(FT., Pos) %>% 
    arrange(desc(Age)) %>% 
    summarize('FT'=mean(FT., na.rm=T)) %>% 
    ggplot(aes(Age, FT)) + 
    geom_line(size=1) + 
    ggtitle("자유투")

sg_x2p <- stat_1 %>% filter(Pos == 'SG' & MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(X2P., Pos) %>% 
    arrange(desc(Age)) %>% 
    summarize('X2P'=mean(X2P., na.rm=T)) %>% 
    ggplot(aes(Age, X2P)) + 
    geom_line(size=1) + 
    ggtitle("2점슛")

sg_x3p <- stat_1 %>% filter(Pos == 'SG' & MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(X3P., Pos) %>% 
    arrange(desc(Age)) %>% 
    summarize('X3P'=mean(X3P., na.rm=T)) %>% 
    ggplot(aes(Age, X3P)) + 
    geom_line(size=1) + 
    ggtitle("3점슛")

title_sg <- textGrob("슈팅가드 세부 스텟",
                     gp=gpar(fontsize=20,fontface=2))
grid.arrange(sg_ast, sg_ft, sg_pt, sg_x2p, sg_x3p, ncol=2, 
             top = title_sg)

# PG (PT, 2P, 3P, AST, STL, FT)
pg_pt <- stat_1 %>% filter(Pos == 'PG' & MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(PT, Pos) %>% 
    arrange(desc(Age)) %>% 
    summarize('PT'=mean(PT, na.rm=T)) %>% 
    ggplot(aes(Age, PT)) + 
    geom_line(size=1) + 
    ggtitle("경기당 득점")

pg_ast <- stat_1 %>% filter(Pos == 'PG' & MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(AST, Pos) %>% 
    arrange(desc(Age)) %>% 
    summarize('AST'=mean(AST, na.rm=T)) %>% 
    ggplot(aes(Age, AST)) + 
    geom_line(size=1) + 
    ggtitle("어시스트")

pg_x2p <- stat_1 %>% filter(Pos == 'PG' & MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(X2P., Pos) %>% 
    arrange(desc(Age)) %>% 
    summarize('X2P'=mean(X2P., na.rm=T)) %>% 
    ggplot(aes(Age, X2P)) + 
    geom_line(size=1) + 
    ggtitle("2점슛")

pg_x3p <- stat_1 %>% filter(Pos == 'PG' & MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(X3P., Pos) %>% 
    arrange(desc(Age)) %>% 
    summarize('X3P'=mean(X3P., na.rm=T)) %>% 
    ggplot(aes(Age, X3P)) + 
    geom_line(size=1) + 
    ggtitle("3점슛")

pg_ft <- stat_1 %>% filter(Pos == 'PG' & MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(FT., Pos) %>% 
    arrange(desc(Age)) %>% 
    summarize('FT'=mean(FT., na.rm=T)) %>% 
    ggplot(aes(Age, FT)) + 
    geom_line(size=1) + 
    ggtitle("자유투")

pg_stl <- stat_1 %>% filter(Pos == 'PG' & MP>=median(MP)) %>% 
    group_by(Age, Pos) %>% 
    select(STL, Pos) %>% 
    arrange(desc(Age)) %>% 
    summarize('STL'=mean(STL, na.rm=T)) %>% 
    ggplot(aes(Age, STL)) + 
    geom_line(size=1) + 
    ggtitle("스틸")

library(ggplot2)
library(gridExtra)
library(grid)
library(gtable)

title_pg <- textGrob("포인트가드 세부 스텟",
                  gp=gpar(fontsize=20,fontface=2))
grid.arrange(pg_ast, pg_ft, pg_pt, pg_x2p, pg_x3p, pg_stl, ncol=2, 
             top = title_pg)

