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
