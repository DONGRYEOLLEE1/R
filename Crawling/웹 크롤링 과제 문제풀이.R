# 한빛 25 페이지 까지 
library(rvest)
library(stringr)
library(dplyr)

basic_url <- 'https://www.hanbit.co.kr/media/books'
sub_url <- 'new_book_list.html?page='
url <- paste(basic_url, sub_url, sep = '/')
urls <- c()

for (i in 1:25) {
    urls[i+1] <- paste0(url, i)
}

html <- read_html(urls[2])
container <- html_node(html, '#container')
book_list <- html_node(container, '.new_book_list_wrap')
sub_book_list <- html_node(book_list, '.sub_book_list_area')
lis <- html_nodes(sub_book_list, 'li')



title_vector <- c()
writer_vector <- c()
page_vector <- c()
price_vector <- c()

for (i in 2:25) {
    urls[i+1] <- paste0(basic_url, i)
    for (li in lis) {
        info <- html_node(li, '.info')
        title <- info %>% 
            html_node('.book_tit') %>% 
            html_text()
        writer <- info %>% 
            html_node('.book_writer') %>% 
            html_text()
        href <- li %>% 
            html_node('.info') %>% 
            html_node('a') %>% 
            html_attr('href')
        book_url <- paste(basic_url, href, sep='/')
        book_html <- read_html(book_url)
        info_list <- html_node(book_html, 'ul.info_list')
        book_lis <- html_nodes(info_list, 'li')
        for (book_li in book_lis) {
            item <- book_li %>% 
                html_node('strong') %>% 
                html_text()
            if (substring(item, 1, 3) == '페이지') {
                page <- book_li %>% 
                    html_node('span') %>% 
                    html_text()
                len <- str_length(page) 
                page <- as.integer(substring(page, 1, len-2))
                break
            }
        }
        pay_info <- html_node(book_html, '.payment_box.curr')
        ps <- html_nodes(pay_info, 'p')
        price <- ps[2] %>% 
            html_node('.pbr') %>% 
            html_node('strong') %>% 
            html_text()
        price <- as.integer(gsub(',','',price))
        
        title_vector <- c(title_vector, title)
        writer_vector <- c(writer_vector, writer)
        page_vector <- c(page_vector, page)
        price_vector <- c(price_vector, price)
    }
}

new_books <- data.frame(title=title_vector, writer=writer_vector, page=page_vector, price=price_vector)
View(new_books)


# 지니뮤직 전일차트 1~100위 (Rank, Last_rank, Title, Aritst, Album)
library(rvest)
library(httr)
library(stringr)
library(dplyr)
url_1 <- 'https://www.genie.co.kr/chart/top200?ditc=D&ymd=20210510&hh=17&rtm=Y&pg=1'
url_2 <- 'https://www.genie.co.kr/chart/top200?ditc=D&ymd=20210510&hh=17&rtm=Y&pg=2'

html <- read_html(url_1)
# 전주 순위  유지, 상승, 하강 (1, 3, 4)

