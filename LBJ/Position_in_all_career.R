setwd('C:/workspace/R')
LBJ <- read.csv('data/LBJ.csv')
library(dplyr)
library(ggplot2)

AND1 <- LBJ %>% filter(Age >= 19) %>% group_by(Age) %>% select(Pos, MP, And1, Age)


ggplot(AND1, aes(x=Age, y=And1, col=Pos)) + geom_line(size = 1) + geom_point(size = 4) +
    ggtitle('LBJ position in all career') +
    theme(plot.title=element_text(size=20, color="#008080"))

