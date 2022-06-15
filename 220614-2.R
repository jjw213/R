#한글 데이터 분석
install.packages("multilinguer")
install.packages("remotes")

#github 링크를 통해서 패키지를 다운로드
remotes::install_github('haven-jeon/KoNLP',upgrade = "never",
                        INSTALL_opts=c("--no-multiarch"))
install.packages("rJava")

library(multilinguer)
library(rJava)
library(KoNLP)

devtools::install_github("lchiffon/wordcloud2")
library(wordcloud2)
# KoNLP 패키지의 한글 사전 설정
# 분석하고자 하는 한글 문장에 포함된 단어

useSejongDic()
useNIADic()
word_data <- readLines("애국가(가사).txt")
word_data

#애국가에서 각 행에서 명사만 추출해보기
worddata2<-sapply(word_data, extractNoun,
                  USE.NAMES = F )
#sapply는 해당 데이터세트의 모든 행에 함수를 적용,
#USE.NAMES 옵션은 데이터의 값에 이름을 붙일건지 T,F
worddata2
add_words<-c("백두산","남산","철갑","가을","하늘","달")
buildDictionary(user_dic = data.frame(
  add_words,rep("ncn", length(add_words))), 
  replace_usr_dic = T) #중복된 내용 덮어 쓸지 T,F
worddata2

#2차원 데이터 구조인 행렬을 1차원인 벡터로 변환
undata <- unlist(worddata2)
undata

#추출된 명사가 몇번 나왔는지 빈도수 확인
word_table <- table(undata)
word_table

#단어의 길이가 2 이상인 것만 추출해서 사용
undata2<-Filter(function(x) {nchar(x)>=2},undata)
undata2

#단어의 길이가 2 이상인 빈도수 확인
word_table2 <- table(undata2)
word_table2

sort(word_table2, decreasing = T)

library(wordcloud2) # R에서 워드클라우드 그리는 함수
wordcloud2(word_table2,color = "random-light",
           shape = "star")
#dempFreq => 내장된 데이터 세트
wordcloud2(demoFreq)
wordcloud2(demoFreq, color = rep_len(c("red","blue"),
                                     nrow(demoFreq)))

#색이 검정 바탕 흰 이미지
wordcloud2(demoFreq,figPath = "twitter.jpg")
