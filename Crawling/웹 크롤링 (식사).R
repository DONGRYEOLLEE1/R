# 식신 홈페이지 (상호, 간단한 소개, 전화번호, 주소)
library(rvest)
library(stringr)
library(dplyr)

url <- 'https://www.siksinhot.com/search?keywords=%ED%95%9C%EB%82%A8%EB%8C%80'
html <- read_html(url)

lis <- html %>% 
    html_node('div.listTy1') %>% 
    html_node('ul') %>% 
    html_children()
length(lis)

li <- lis[1]

# title 
li <- lis[1]
title <- li %>% html_node('.box_tit') %>% html_text()
title

# detail
detail <- li %>% html_node('p') %>% html_text()
detail

####
title_vec <- c()
detail_vec <- c()
for (li in lis) {
    
    title <- li %>% html_node('.box_tit') %>% html_text()
    detail <- li %>% html_node('p') %>% html_text()
}
new_food <- data.frame(title=title_vec, detail=detail_vec)
View(new_food)
