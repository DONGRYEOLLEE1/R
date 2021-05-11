# 식신 홈페이지 (상호, 간단한 소개, 전화번호, 주소)
library(rvest)
library(stringr)
library(dplyr)

base_url <- 'https://www.siksinhot.com/'
sub_url <- 'search?keywords=한남대'
url <- paste(base_url, sub_url, sep = '/')
url
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

####  title , detail
title_vec <- c()
detail_vec <- c()
for (li in lis) {
    
    title <- li %>% html_node('.box_tit') %>% html_text()
    detail <- li %>% html_node('p') %>% html_text()
    title_vec <- c(title_vec, title)
    detail_vec <- c(detail_vec, detail)
}
new_food <- data.frame(title=title_vec, detail=detail_vec)
View(new_food)


# 세부내용 크롤링 (주소 , 전화번호)
li <- lis[1]
href <- li %>% html_node('.cont') %>% html_node('a') %>% html_attr('href')
href
info_url <- paste(base_url, href, sep = '.')
info_url
info_html <- read_html(info_url)

phone <- info_html %>% 
    html_node('.store_info') %>% 
    html_node('.p_tel') %>% 
    html_node('p') %>% 
    html_text()
phone

address <- info_html %>% 
    html_node('.store_info') %>% 
    html_node('.txt_adr') %>% 
    html_text()
address

######## title, detail, phone, address
title_vec <- c()
detail_vec <- c()
phone_vec <- c()
address_vec <- c()

for (li in lis) {
    
    title <- li %>% html_node('.box_tit') %>% html_text()
    detail <- li %>% html_node('p') %>% html_text()
    
    href <- li %>% html_node('.cont') %>% html_node('a') %>% html_attr('href')
    info_url <- paste(base_url, href, sep = '.')
    info_html <- read_html(info_url)
    
    phone <- info_html %>% 
        html_node('.store_info') %>% 
        html_node('.p_tel') %>% 
        html_node('p') %>% 
        html_text()
    
    address <- info_html %>% 
        html_node('.store_info') %>% 
        html_node('.txt_adr') %>% 
        html_text()
    
    title_vec <- c(title_vec, title)
    detail_vec <- c(detail_vec, detail)
    phone_vec <- c(phone_vec, phone)
    address_vec <- c(address_vec, address)
}
new_food <- data.frame(title=title_vec, detail=detail_vec,
                       phone=phone_vec, address=address_vec)
View(new_food)
