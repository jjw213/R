library(readxl)
library(dplyr)
library(reshape2)

ck<-read_excel("치킨집_가공.xlsx")
head(ck)
addr<-substr(ck$소재지전체주소, 11, 16)

#정규식 gsub()
addr_remover_num <-gsub("[0-9]","",addr)
addr_trim<-gsub(" ","",addr_remover_num)
head(addr_trim)
addr_cnt<- addr_trim %>% table() %>% data.frame()
head(addr_cnt)

install.packages("treemap")
library(treemap)
install.packages("igraph")
treemap(addr_cnt,index = ".",vSize = "Freq",title = "치킨집 분포")

#---------
mykey<-"AIzaSyBJmtvPnZL-5Q-lXEgRdZxrBWDqej7ITTI"
install.packages("ggmap")
library(ggmap)
register_google(mykey)
gg_seoul <-get_googlemap("seoul",maptype = "terrain",zoom=15)
ggmap(gg_seoul)
gg_daegu<-get_googlemap("beomeo",maptype = "roadmap",zoom=16)
ggmap(gg_daegu)

station_data<-read.csv("13._역별_주소_및_전화번호.csv")
#주소를 지도위에 표현하기 위해 위도와 경고
#geocode()함수 사용
station_code<-as.character(station_data$구주소)
station_code<-geocode(station_code)
head(station_code)

station_code_final<-cbind(station_data,station_code)
head(station_code_final)

mapo_map<-get_googlemap("mapogu", maptype = "roadmap", zoom = 11)
ggmap(mapo_map)

library(ggplot2)
ggmap(mapo_map)+
  geom_point(data=station_code_final,aes(x=lon,y=lat),color="red",size=3)+
  geom_text(data=station_code_final, aes(label=역명, vjust=-1))

apart_data<-read.csv("아파트(매매)__실거래가_20180513144733.csv")
head(apart_data)
apart_data$전용면적=round(apart_data$전용면적)
count(apart_data,전용면적) %>% arrange(desc(n))
apart_data_85 <- subset(apart_data, 전용면적>=85)
head(apart_data_85)

apart_data_85$거래금액<-gsub(",","",apart_data_85$거래금액.만원.)

head(apart_data_85)
filter(apart_data_85,단지명=="쌍용")

#아파트 가격 평균
#aggregate() =데이터를 그룹별로 묶어서 연산
apart_data_85_cost<-
  aggregate(as.integer(거래금액)~단지명,apart_data_85,mean)
head(apart_data_85_cost)

apart_data_85_cost<-rename(apart_data_85_cost,"거래금액"= "as.integer(거래금액)")

apart_data_85<-apart_data_85[!duplicated(apart_data_85$단지명),]

apart_data_85<-left_join(apart_data_85,apart_data_85_cost,by="단지명")

apart_data_85<-apart_data_85%>%select("단지명","시군구","번지","전용면적","거래금액.y")

head(apart_data_85)

#시군구 번지 합치기
#paste0() : 공백 없이 합치기
apart_address<-paste(apart_data_85$시군구,apart_data_85$번지)
head(apart_address)

apart_address<-data.frame(apart_address)
apart_address<-rename(apart_address,"주소"="apart_address")

#주소를 위도 경도 코드 값을 전환
apart_address_code<-as.character(apart_address$주소) %>% 
  enc2utf8() %>% geocode() # 한글 깨질 수도 있어서 추가
head(apart_address_code)
apart_code_final <-
  cbind(apart_data_85,apart_address,apart_address_code) %>% 
  select("단지명","전용면적","거래금액.y","주소","lon","lat")
head(apart_code_final)

gangnam_map<-get_googlemap("gangnam",maptype = "roadmap", zoom=10)
ggmap(gangnam_map) + 
  geom_point(data=apart_code_final,aes(x=lon,y=lat)) +
  geom_text(data=apart_code_final, aes(label=단지명, vjust=-1)) +
  geom_text(data=apart_code_final, aes(label=거래금액.y, vjust=1)) +
  geom_point(data=station_code_final,aes(x=lon,y=lat),color="red",size=3)+
  geom_text(data=station_code_final, aes(label=역명, vjust=-1))

library(readxl)  
exdata<-read_excel("Sample1.xlsx")
View(exdata)
#어떤 변수들 간에 연관성이 있는지를 확인하는 분석기법
#->상관분석
#자식의 키가 아버지의 키와 상관관계가 있는지 파악
#상관 관계가 있으면 양또는 음의 값(1~-1),
#0에 가까울 수록 상관이 별로 없다.
#cor.test() (Correlatation)
cor.test(exdata$AMT17,exdata$Y17_CNT)
