install.packages("multilinguer")
library(multilinguer)

install.packages("rJava")
install.packages("remotes")
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))

library(KoNLP)
library(rJava)
install.packages("wordcloud2")

useSystemDic()
useSejongDic()
useNIADic()
word_data <- readLines("애국가(가사).txt")
word_data

word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2

add_words <- c("백두산" , "남산" , "철갑" , "가을" , "하늘" , "달")
buildDictionary(user_dic = data.frame(add_words, rep("ncn" , length(add_words))),replace_usr_dic = T)

word_data2 <- sapply(word_data, extractNoun, USE.NAMES=F)
word_data2

undata <- unlist(word_data2)
undata

word_table <- table(undata)
word_table

undata2 <- Filter(function(x) { nchar(x) >= 2} , undata)
word_table2 <- table(undata2)
word_table2

sort(word_table2 , decreasing = T)
library(wordcloud2)
wordcloud2(word_table2)

library(devtools)
library(RColorBrewer)

wordcloud2(word_table2, color="random-light" , backgroundColor = "black")

wordcloud2(word_table2, fontFamily = "consolas" , size=1.2, color="random-light" , backgroundColor = "black", shape="star")

wordcloud2(demoFreq, size = 1.1, color = rep_len(c("red" , "blue"), nrow(demoFreq)))
wordcloud2(demoFreq, minRotation = -pi/6 , maxRotation = -pi/6, rotateRatio = 1)
wordcloud2(demoFreq, figPath = "peace.png")

install_github("lchiffon/wordcloud2")
wordcloud2(demoFreq, figPath = "twitter.jpg")
