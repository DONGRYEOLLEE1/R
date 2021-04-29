library(HistData)
data("GaltonFamilies")

GaltonFamilies <-  GaltonFamilies %>% 
    mutate(father = 2.54*father, 
           childHeight = 2.54*childHeight)
GaltonFamilies

son <- GaltonFamilies %>% 
    filter(gender=="male") %>% 
    group_by(childHeight)
son

son_height <- subset(son, select=c(father, childHeight))
son_height

fat_son <- lm(childHeight ~ father, data=son_height)

plot(son_height)
abline(fat_son, col='red')
summary(fat_son)

# 아버지의 키가 상대적으로 크면 아들인 자식의 키가 아버지보다 작고,
# 아버지의 키가 상대적으로 작으면 아들인 자식의 키는 아버지보다 크다.