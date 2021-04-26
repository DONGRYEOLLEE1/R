# 별그리기
for (i in 1:5) {
    star <- ''
    for (k in 1:i) {
        star <- paste0(star, '+')
    }
    print(star)
}

size <- 5
for (height in 1:size) {
    for(wide in 1:height) {
        print("+")
    }
}
