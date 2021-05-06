# Wikipedia "data science'
library(RCurl)
library(XML)
library(stringr)

html <- readLines('https://en.wikipedia.org/wiki/Data_science')
html <- htmlParse(html, asText = T)
doc <- xpathSApply(html, '//p', xmlValue)
length(doc)
doc[1]
doc[2]
doc[3]
corpus <- doc[2:3]

# 모두 소문자로 변경
corpus <- tolower(corpus)
corpus[1]

# 숫자 제거
# 숫자를 표현하는 정규식 : '\\d' , '[[:digit:]]'
corpus <- gsub('\\d', '', corpus)
corpus[1]

# 구두점 제거
corpus <- gsub('[[:punct:]]', '', corpus)
corpus[1]
corpus[2]
corpus <- gsub('\n', ' ', corpus)
corpus[1]
corpus <- str_trim(corpus, side='right')
corpus[1]

# 불용어 제거
stopwords <- c('a', 'the', 'and', 'in', 'of', 'to', 'but')
gsub('a', '', corpus)         # 문장 내의 모든 a가 사라짐
words <- strsplit(corpus, split=" ")       # 결과가 리스트로
unlist(words)                              # 결과를 리스트 -> 하나의 벡터

l <- list()                                # 빈 리스트 생성
for (word in unlist(words)) {
    if (!word %in% stopwords) {
        l <- append(l, word)
    }
}
corpus <- paste(l, collapse = ' ')
corpus

# `%notin%`을 활용한 for문
`%notin%` <- Negate(`%in%`)
l <- list()                                # 빈 리스트 생성
for (word in unlist(words)) {
    if (word %notin% stopwords) {
        l <- append(l, word)
    }
}
corpus <- paste(l, collapse = ' ')
corpus

